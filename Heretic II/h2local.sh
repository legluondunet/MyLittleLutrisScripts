#!/bin/bash

lang=$1
echo $lang
cd HERETICIICDL/base
rm -f -r spanish-1.pak
if [ $lang = "fr" ]; then tar xfv ../TMP/data/french-1.pak.tar.xz
elif [ $lang = "ge" ]; then tar xfv ../TMP/data/german-1.pak.tar.xz
elif [ $lang = "it" ]; then tar xfv ../TMP/data/italian-1.pak.tar.xz
elif [ $lang = "sp" ]; then tar xfv ../TMP/data/spanish-1.pak.tar.xz
fi
