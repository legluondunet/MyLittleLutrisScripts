#!/bin/bash

w=$1
h=$2
file=$3

wb=$(echo 'obase=16;' $w | bc)
hb=$(echo 'obase=16;' $h | bc)

echo $w en hexa: $wb soit ${#wb} caractères
echo $h en hexa: $hb soit ${#hb} caractères

cd drive_c/tmp/

sed -i -e 's/"windowwidth"\=dword\:.*/"windowwidth"\=dword\:'$wb'/' -e 's/"windowheight"\=dword\:.*/"windowheight"\=dword\:'$hb'/' $file


iconv -f utf-8 -t utf16le $file -o warcraft_iii.reg
