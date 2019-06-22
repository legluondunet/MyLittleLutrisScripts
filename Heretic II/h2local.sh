#!/bin/bash

lang=$1
echo $lang
cd HERETICIICDL/base
rm -f -r spanish-1.pak
if [ $lang = "fr" ]; then tar xfv ../TMP/french-1.pak.tar.xz
elif [ $lang = "ge" ]; then tar xfv ../TMP/german-1.pak.tar.xz
elif [ $lang = "it" ]; then tar xfv ../TMP/italian-1.pak.tar.xz
elif [ $lang = "sp" ]; then tar xfv ../TMP/spanish-1.pak.tar.xz
fi
