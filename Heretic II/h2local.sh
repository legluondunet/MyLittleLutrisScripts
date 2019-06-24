#!/bin/bash

lang=$1
echo $lang

if [ -f "HERETICIICDL/heretic2" ]; then 
dir=../../base
cd HERETICIICDL/base
rm -f -r french-1.pak german-1.pak italian-1.pak spanish-1.pak
cd ../TMP/data
fi

if [ -f "../Program Files (x86)/Heretic II/" ]; then
dir="../../Program Files (x86)/Heretic II/base"
cd "../Program Files (x86)/Heretic II/base"
rm -f -r french-1.pak german-1.pak italian-1.pak spanish-1.pak
cd ../../../tmp/data
fi

echo "The script you are running has basename `basename "$0"`, dirname `dirname "$0"`"
echo "The present working directory is `pwd`"

if [ $lang = "fr" ]; then tar xfv french-1.pak.tar.xz -C "$dir"
elif [ $lang = "ge" ]; then tar xfv german-1.pak.tar.xz -C "$dir"
elif [ $lang = "it" ]; then tar xfv italian-1.pak.tar.xz -C "$dir"
elif [ $lang = "sp" ]; then tar xfv spanish-1.pak.tar.xz -C "$dir"
fi
