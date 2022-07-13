#!/usr/bin/env bash

# Templates for next patch
#echo " === !! UNTESTED PATCH. CHECK FOR BANS USING A TRASH ACCOUNT !! ==="
#echo " ===      REPORT RESULTS TO THE MAIN REPOSITORY. THANK YOU.     ==="
#echo ""
#echo "If you would like to test this patch, modify this script and remove the line below this one."
#exit 1

#echo " === !! This patch is very new but almost identical to 1.5.1!! ==="
#echo " === If you are worried, use a secondary account for a few days ==="
#read -p "Continue? [Enter] " _dumpster_


# MacOS and *BSD do not have md5sum: use md5 instead
if [[ $(uname) == "Darwin" || $(uname) == *"BSD" ]]; then
	md5sum() {
		md5 -q $@
	}
fi

DIR=$(dirname "${BASH_SOURCE[0]}")
DATADIR=$(find -type d -name "*_Data")
FILE="UnityPlayer.dll"
CEXE1="$DATADIR/upload_crash.exe"
CEXE2="$DATADIR/Plugins/crashreport.exe"
sum=($(md5sum $FILE))
reltype="" # os, cn, bb

# original hashes
if [ "${sum}" == "8c8c3d845b957e4cb84c662bed44d072" ]; then
	reltype="os"
	echo "--- Applying for: International version"
fi
if [ "${sum}" == "6c5e742fc4f465d5488a73985efcf298" ]; then
	if [ -e "$DATADIR/Plugins/PCGameSDK.dll" ]; then
		reltype="bb"
		echo "--- Applying for: bilibili CN version"
	else
		reltype="cn"
		echo "--- Applying for: miHoYo CN version"
	fi
fi
if [ -z "$reltype" ]; then
	# The patch might corrupt invalid/outdated files if this check is skippd.
	echo "[ERROR] Wrong file version or the patch is already applied"
	echo " -> md5sum: ${sum}" && exit 1
fi


# =========== DO NOT REMOVE START ===========
if [[ -e "$DIR/$FILE" ]]; then
	# There is a good reason for this check. Do not pollute the game directory.
	echo "[ERROR] Invalid patch download directory. Please move all"
	echo "        patch files outside the game directory prior executing."
	echo " -> See README.md for proper installation instructions" && exit 1
fi
# ===========  DO NOT REMOVE END  ===========


if ! command -v xdelta3 &>/dev/null; then
	echo "[ERROR] xdelta3 application is required"
	echo " -> Debian/Ubuntu: apt install xdelta3"
	echo " -> Fedora: dnf install xdelta"
	echo " -> Arch/Arch-based: pacman -S xdelta3"
	echo " -> macOS: \"port install xdelta\" or \"brew install xdelta\""
	exit 1
fi

# ===========================================================
echo ""
echo "[WARNING] Hereby you are violating the game's Terms of Service!"
echo "          Do you accept the risk and possible consequences?"
echo "          Use Ctrl+C to abort this script if you are not sure."
read -p "Accept? [y/n] " choice

if [[ ! "$choice" == [JjSsYy]* ]]; then
	exit 1
fi

echo
echo "--- Setting up blocked servers"

# START OF SUDO DANGER ZONE
etc_hosts="$(cat /etc/hosts)"

# See dev_tools/network.md (up-to-date as of 2.7.0)
# Note: The uspider domain is no longer used on Internationl. Keeping just in case.
if [[ "$reltype" == "os" ]]; then
	servers=$(cat <<EOF
# Genshin logging servers (do not remove!)
0.0.0.0 overseauspider.yuanshen.com
0.0.0.0 log-upload-os.hoyoverse.com

EOF
	)
else
	servers=$(cat <<EOF
# Genshin logging servers (do not remove!)
0.0.0.0 log-upload.mihoyo.com
0.0.0.0 uspider.yuanshen.com

EOF
	)
fi

if [[ ! "$etc_hosts" == *"$servers"* ]]; then
	echo "[MANDATORY] Adding following logging servers to /etc/hosts"
	echo "            If you really really want to skip this (Ctrl+C),"
	echo "            PLEASE add the entries manually. Otherwise they will receive"
	echo "            logs about The Wine project, hence UNCOVERING THIS PATCH!"
	echo "$servers" | sudo -k tee -a /etc/hosts
	if [ $? -ne 0 ]; then
		echo "$servers"
		read -p "Please append these lines to your /etc/hosts file now. Enter to continue."
	fi
else
	echo "--- Logging servers are already blocked. Skip."
fi


servers=$(cat <<EOF
# Optional Unity proxy/cdn servers
0.0.0.0 prd-lender.cdp.internal.unity3d.com
0.0.0.0 thind-prd-knob.data.ie.unity3d.com
0.0.0.0 thind-gke-usc.prd.data.corp.unity3d.com
0.0.0.0 cdp.cloud.unity3d.com
0.0.0.0 remote-config-proxy-prd.uca.cloud.unity3d.com

EOF
)
if [[ ! "$etc_hosts" == *"$servers"* ]]; then
	echo ""
	echo "[Optional] Adding common Unity proxy/cdn servers to /etc/hosts"
	echo "           Normally this does not cause any issues. If issues arise in other games,"
	echo "           consider commenting a few lines to check what makes the difference."
	read -p "Add 5 servers? [y/n] " choice

	if [[ "$choice" == [JjSsYy]* ]]; then
		echo "-- Adding proxy/cdn servers"
		echo "$servers" | sudo tee -a /etc/hosts
		if [ $? -ne 0 ]; then
			read -p "--- FAILED to add the servers. Enter to continue."
		fi
	fi
else
	echo "--- Unity proxy/cdn servers are already blocked. Skip."
fi

etc_hosts=""
# END OF SUDO DANGER ZONE

echo ""

# No crashes shall be reported!
echo "--- Renaming the crash reporter(s)"

if [[ -e "$CEXE1" ]]; then
	# Replace existing backups
	mv -f "$CEXE1" "$CEXE1.bak"
fi
if [[ -e "$CEXE2" ]]; then
	mv -f "$CEXE2" "$CEXE2.bak"
fi

# Registry entry to add on startup
cp -f "$DIR/patch_files/mhyprotect_running.reg" .

# Add launcher & force update to ensure the checks are performed
echo "--- Adding launcher script"
cp -f "$DIR/patch_files/launcher.bat" .
if [[ "$reltype" != "os" ]]; then
	# Same thing but different
	sed -i "s/BH3/YuanShen/g" "launcher.bat"
	sed -i "s/log-upload-os.hoyoverse/log-upload.mihoyo/g" "launcher.bat"
	sed -i "s/overseauspider/uspider/g" "launcher.bat"
fi

# Do the patch now, replace existing backups (hash confirmed)
echo "--- Patching UnityPlayer"
xdelta_fail() {
	mv -vf "$FILE.bak" "$FILE"
	exit 1
}

mv -f "$FILE" "$FILE.bak"
# Perform patch or restore .bak on failure
xdelta3 -d -s "$FILE.bak" "$DIR/patch_files/unityplayer_patch_${reltype}.vcdiff" "$FILE" || xdelta_fail


# Done!
echo "==> Patch applied! Enjoy the game."
echo
echo "[NOTICE]  Please refrain from sharing this project in public so"
echo "          that there can be Linux patches in the future. Thank you."

exit 0
