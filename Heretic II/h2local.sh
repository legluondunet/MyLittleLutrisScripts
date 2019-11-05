#!/bin/bash

lang=$1
echo "Language choisi: " $lang

if [ $lang = "keep" ]; then exit
fi

dir="../tmp2/data/"

if [ -f "HERETICIICDL/heretic2" ]; then 
echo "installation CD Linux localisée"
cd HERETICIICDL/base
fi

if [ -f "drive_c/Program Files (x86)/Heretic II/heretic2.exe" ]; then
echo "installation CD Windows localisée"
cd "drive_c/Program Files (x86)/Heretic II/base"
fi

rm -f -r french-1.pak german-1.pak italian-1.pak spanish-1.pak htic2-1.pak gamemsg.txt levelmsg.txt menus.cfg

echo "The script you are running has basename `basename "$0"`, dirname `dirname "$0"`"
echo "The present working directory is `pwd`"

echo "install " $lang " files"
if [ $lang = "fr" ]; then tar xfv $dir/french-1.pak.tar.xz
mv french-1.pak htic2-1.pak
elif [ $lang = "ge" ]; then tar xfv $dir/german-1.pak.tar.xz
mv german-1.pak htic2-1.pak
elif [ $lang = "it" ]; then tar xfv $dir/italian-1.pak.tar.xz
mv italian-1.pak htic2-1.pak
elif [ $lang = "sp" ]; then tar xfv $dir/spanish-1.pak.tar.xz
mv spanish-1.pak htic2-1.pak
fi

echo "ls -l $dir"
ls -l $dir

