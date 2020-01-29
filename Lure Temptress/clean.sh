#!/bin/bash

lang=$1

echo "choosed language: $lang "

if [ "$lang" != "en" ]
then
lurezip="lure-$lang-1.1.zip"
else
lurezip="lure-1.1.zip"
fi

wget https://www.scummvm.org/frs/extras/Lure%20of%20the%20Temptress/$lurezip
unzip -j $lurezip
rm -f -r $lurezip *.ega 
