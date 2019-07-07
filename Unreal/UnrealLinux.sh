#!/bin/sh
# Use US keyboard layout
USLAYOUT="true"

setuslayout() {
	setxkbmap -model pc101 us -print | xkbcomp - ${DISPLAY} 2>/dev/null
}
trap setxkbmap EXIT

#games are better played with us keyboard layout
if [ "${USLAYOUT}" = "true" ]; then
setuslayout
fi

cd System
MESA_EXTENSION_MAX_YEAR=1999
#LD_LIBRARY_PATH=../lin_convenience_libs
#export LD_LIBRARY_PATH
./UnrealLinux.bin -log

if [ "${USLAYOUT}" = "true" ]; then
	# reset kb layout
	setxkbmap >/dev/null 2>&1

	# reset xmodmap
	test -r ${HOME}/.Xmodmap && xmodmap ${HOME}/.Xmodmap >/dev/null 2>&1
fi
