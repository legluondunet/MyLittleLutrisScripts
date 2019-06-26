#!/bin/bash

lang=$1
echo $lang

if [ -f "HERETICIICDL/heretic2" ]; then 
dir=../TMP/data
cd HERETICIICDL/base
rm -f -r french-1.pak german-1.pak italian-1.pak spanish-1.pak htic2-1.pak
fi

if [ -f "drive_c//Program Files (x86)/Heretic II/heretic2.exe" ]; then
dir="../../../tmp/data"
cd "drive_c/Program Files (x86)/Heretic II/base"
rm -f -r french-1.pak german-1.pak italian-1.pak spanish-1.pak htic2-1.pak
fi

echo "The script you are running has basename `basename "$0"`, dirname `dirname "$0"`"
echo "The present working directory is `pwd`"

if [ $lang = "fr" ]; then tar xfv $dir/french-1.pak.tar.xz
mv french-1.pak htic2-1.pak
elif [ $lang = "ge" ]; then tar xfv $dir/german-1.pak.tar.xz
mv german-1.pak htic2-1.pak
elif [ $lang = "it" ]; then tar xfv $dir/italian-1.pak.tar.xz
mv italian-1.pak htic2-1.pak
elif [ $lang = "sp" ]; then tar xfv $dir/spanish-1.pak.tar.xz
mv spanish-1.pak htic2-1.pak
fi
