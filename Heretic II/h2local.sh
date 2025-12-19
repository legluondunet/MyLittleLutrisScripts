#!/bin/bash

lang=$1
echo "Language choisi: " $lang

if [ $lang = "english" ]; then exit
fi

if [ -f "drive_c/Program Files (x86)/Heretic II/Heretic2.exe" ]; then
echo "installation CD Windows localisée"
cd "drive_c/Program Files (x86)/Heretic II/Base"
else echo "Le jeu n'a pas été trouvé"
exit
fi

rm -f -r french-1.pak german-1.pak italian-1.pak spanish-1.pak htic2-1.pak gamemsg.txt levelmsg.txt menus.cfg

wget --no-check-certificate "https://github.com/legluondunet/MyLittleLutrisScripts/raw/master/Heretic%20II/lang/"$lang"-1.pak.tar.xz"
tar xfv $lang-1.pak.tar.xz
mv $lang-1.pak htic2-1.pak
rm -f -r $lang-1.pak.tar.xz


