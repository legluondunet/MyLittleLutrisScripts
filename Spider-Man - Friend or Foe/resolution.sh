#!/bin/bash

w=$1
h=$2
file=$3
regkeyX=$4
regkeyY=$5

wb=$(echo 'obase=16;' $w | bc)
hb=$(echo 'obase=16;' $h | bc)

echo $w en hexa: $wb soit ${#wb} caractères
echo $h en hexa: $hb soit ${#hb} caractères

wbf=$(printf "%08d\n" $wb)
hbf=$(printf "%08d\n" $hb)

echo "importation de la résolution en hexadécimale dans la base de registre: " $wbf " x " $hbf

sed -i -e 's/"'$regkeyX'"\=dword\:.*/"'$regkeyX'"\=dword\:'$wb'/' -e 's/"'$regkeyY'"\=dword\:.*/"'$regkeyY'"\=dword\:'$hb'/' $file

echo "sed -i -e 's/"'$regkeyX'"\=dword\:.*/"'$regkeyX'"\=dword\:'$wb'/' -e 's/"'$regkeyY'"\=dword\:.*/"'$regkeyY'"\=dword\:'$hb'/' $file"

file2=${file::-9}
echo "la variable file2: "$file2"--> "$file2"_utf16le.reg"

iconv -f utf-8 -t utf16le $file -o $file2"_utf16le.reg"

