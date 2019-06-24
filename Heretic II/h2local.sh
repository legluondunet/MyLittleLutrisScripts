#!/bin/bash

lang=$1
echo $lang
if [ -f "HERETICIICDL/heretic2" ]; then 
dir=HERETICIICDL/base
cd HERETICIICDL/TMP/data
fi
if [ -f "../Program Files (x86)/Heretic II/" ]; then
dir="../Program Files (x86)/Heretic II/base"
cd data
fi
rm -f -r french-1.pak.tar.xz german-1.pak.tar.xz italian-1.pak.tar.xz spanish-1.pak
if [ $lang = "fr" ]; then tar xfv french-1.pak.tar.xz -C "$dir"
elif [ $lang = "ge" ]; then tar xfv german-1.pak.tar.xz -C "$dir"
elif [ $lang = "it" ]; then tar xfv italian-1.pak.tar.xz -C "$dir"
elif [ $lang = "sp" ]; then tar xfv spanish-1.pak.tar.xz -C "$dir"
fi
