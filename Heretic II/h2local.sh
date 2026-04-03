#!/bin/bash

lang="$1"

echo "Language choisi: ${lang}"

if [ "$lang" = "english" ]; then exit
elif [ -d "drive_c/Program Files (x86)/Heretic II" ]; then cd "./drive_c/Program Files (x86)/Heretic II/Base"
elif [ -d "drive_c/Heretic2R" ]; then cd "drive_c/Heretic2R/base"
fi
rm -f french-1.pak german-1.pak italian-1.pak spanish-1.pak Htic2-1.pak gamemsg.txt levelmsg.txt menus.cfg
wget --no-check-certificate "https://github.com/legluondunet/MyLittleLutrisScripts/raw/master/Heretic%20II/lang/${lang}-1.pak.tar.xz"
tar xfv "${lang}-1.pak.tar.xz"
mv "${lang}-1.pak" "htic2-1.pak"
rm -f "${lang}-1.pak.tar.xz"
