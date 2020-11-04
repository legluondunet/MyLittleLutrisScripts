#!/bin/bash

lang=$1
echo "Language choisi: " $lang

if [ $lang = "keep" ]; then exit
fi

if [ -f "HERETICIICDL/heretic2" ]; then 
echo "installation CD Linux localisée"
cd HERETICIICDL/base
fi

if [ -f "drive_c/Program Files (x86)/Heretic II/heretic2.exe" ]; then
echo "installation CD Windows localisée"
cd "drive_c/Program Files (x86)/Heretic II/base"
fi

rm -f -r french-1.pak german-1.pak italian-1.pak spanish-1.pak htic2-1.pak gamemsg.txt levelmsg.txt menus.cfg

wget "https://github.com/legluondunet/MyLittleLutrisScripts/raw/master/Heretic%20II/lang/"$lang"-1.pak.tar.xz"
tar xfv $lang-1.pak.tar.xz
mv $lang-1.pak htic2-1.pak
rm -f -r $lang-1.pak.tar.xz

