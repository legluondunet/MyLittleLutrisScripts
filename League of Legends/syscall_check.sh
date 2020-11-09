#!/usr/bin/env sh

# If abi.vsyscall32=0 is already set, no need to do anything
if [ "$(cat /proc/sys/abi/vsyscall32)" -eq 0 ]; then
    exit 0
fi

dialog() {
    zenity "$@" --icon-name='lutris' --width="400" --title="League of Legends anticheat compatibility check"
}

final_check() {
    if [ "$(cat /proc/sys/abi/vsyscall32)" -ne 0 ]; then
        dialog --warning --text="As far as this script can detect, your system is not configured to work with League's anticheat. Please verify that you can get into the practice too before playing a multiplayer game."
    fi
}

trap final_check EXIT

if grep -E -x -q "abi.vsyscall32( )?=( )?0" /etc/sysctl.conf; then
    if dialog --question --text="It looks like you already configured your system to work with League anticheat, and saved the setting to persist across reboots. However, for some reason the persistence part did not work.\n\nFor now, would you like to enable the setting again until the next reboot?"
    then
        pkexec sh -c 'sysctl -w abi.vsyscall32=0'
    fi
    exit 0
fi

once="Change setting until next reboot"
persist="Change setting and persist after reboot"
manual="Show me the commands; I'll handle it myself"

if dialog --question --text="League of Legends' anticheat requires using a modified version of wine and changing a system setting. Otherwise, the game will crash after champion select. Wine-lol comes with the Lutris installer, but as far as this script can detect, the setting has not been changed yet.\nNote: The setting (abi.vsyscall32=0) may reduce the performance of some 32 bit applications.\n\nWould you like to change the setting now?"
then
    # I tried to embed the command in the dialog and run the output, but
    # parsing variables with embedded quotes is an excercise in frustration.
    RESULT=$(dialog --list --radiolist --height="200" \
        --column="" --column="Command" \
        "TRUE" "$once" \
        "FALSE" "$persist" \
        "FALSE" "$manual")

    case "$RESULT" in
        "$once")
            pkexec sh -c 'sysctl -w abi.vsyscall32=0'
            ;;
        "$persist")
            pkexec sh -c 'echo "abi.vsyscall32 = 0" >> /etc/sysctl.conf && sysctl -p'
            ;;
        "$manual")
            dialog --info --no-wrap --text="To change the setting (a kernel parameter) until next boot, run:\n\nsudo sh -c 'sysctl -w abi.vsyscall32=0'\n\nTo persist the setting between reboots, run:\n\nsudo sh -c 'echo \"abi.vsyscall32 = 0\" >> /etc/sysctl.conf &amp;&amp; sysctl -p'"
            # Anyone who wants to do it manually doesn't need another warning
            trap - EXIT
            ;;
        *)
            echo "Dialog canceled or unknown option selected: $RESULT"
            ;;
    esac
fi
