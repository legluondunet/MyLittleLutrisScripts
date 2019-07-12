#!/bin/bash

w=$1
h=$2
wb=$(echo 'obase=16;' $w | bc)
hb=$(echo 'obase=16;' $h | bc)

echo $w en hexa: $wb soit ${#wb} caractères
echo $h en hexa: $hb soit ${#hb} caractères

cd drive_c/tmp/

sed -i 's/"Width"\=dword\:.*/"Width"\=dword\:'$wb'/'  fp.reg
sed -i 's/"Height"\=dword\:.*/"Height"\=dword\:'$hb'/' fp.reg

iconv -f utf-8 -t utf16le fp.reg -o fp2.reg
