#!/usr/bin/env bash

ANCHOR=""
DATADIR=$(find -type d -name "*_Data")

if [ -e "BH3.exe" ]; then
	ANCHOR="BH3.exe"
fi
if [ -e "YuanShen.exe" ]; then
	ANCHOR="YuanShen.exe"
fi
if [ -z "$ANCHOR" ]; then
	echo "==> Game executable not found. Wrong directory?"
	exit 1
fi

# Restore files that have a backup
FILE="UnityPlayer.dll"
CEXE1="$DATADIR/upload_crash.exe"
CEXE2="$DATADIR/Plugins/crashreport.exe"
XLUA="$DATADIR/Plugins/xlua.dll"

# macOS has a different version of stat
if [ $(uname) = "Darwin" ]; then
	STATFLAGS="-f %a"
else
	STATFLAGS="-c %Y"
fi

# Reference timestamp to avoid restoring old/invalid backups
ref_timestamp=($(stat $STATFLAGS "$ANCHOR"))

restore_file() {
	# $1 -> File name
	# $2 -> Human readable description

	if [[ ! -e "$1.bak" ]]; then
		echo "--- Nothing to restore for '$1' (no .bak file)"
		return 0
	fi

	# Do not restore backups from old game versions
	difftime=$(( $ref_timestamp - $(stat $STATFLAGS "$1.bak") ))
	# Strip negative sign is equal to abs()
	if [[ ${difftime#-} -gt 3600 ]]; then
		echo "==> ERROR: Backup '$1.bak' is older than the current game version. Ignoring."
		return 1
	fi

	# Restore from backup
	mv -f "$1.bak" "$1"
	echo "--- Restored: $2"
	return 0
}

restore_file "$FILE" "$FILE"
restore_file "$XLUA" "$XLUA"

if [[ -e "$CEXE1" ]]; then
	echo "--- Crash reporter 1 already exists"
else
	restore_file "$CEXE1" "Crash reporter 1"
fi

if [[ -e "$CEXE2" ]]; then
	echo "--- Crash reporter 2 already exists"
else
	restore_file "$CEXE2" "Crash reporter 2"
fi


echo "--- Removing all newly added files"
# The error messages for inexistent files are intended
rm "launcher.bat"
rm "mhyprot2_running.reg"

# dxvk files
rm *.dxvk-cache
rm *_d3d9.log
rm *_d3d11.log
rm *_dxgi.log


echo "==> Patch reverted."
exit 0
