#!/bin/bash

w=$1
h=$2

wb=$(echo 'obase=16;' $w | bc)
hb=$(echo 'obase=16;' $h | bc)

echo $w en hexa: $wb soit ${#wb} caractères
echo $h en hexa: $hb soit ${#hb} caractères

wbf=$(printf "%08d\n" $wb)
hbf=$(printf "%08d\n" $hb)

echo "importation de la résolution en hexadécimale dans la base de registre: " $wbf " x " $hbf

cd "drive_c/Program Files (x86)/Warcraft III"
if [ warcraft_iii_cd_utf8.reg ]
then
echo le fichier warcraft_iii_cd_utf8.reg est présent
sed -i -e 's/"reswidth"\=dword\:.*/"reswidth"\=dword\:'$wb'/' -e 's/"resheight"\=dword\:.*/"resheight"\=dword\:'$hb'/' -e 's/"maxfps"\=dword\:.*/"maxfps"\=dword\:'3c'/' warcraft_iii_cd_utf8.reg
#iconv -f utf-8 -t utf16le warcraft_iii_cd_utf8.reg -o warcraft_iii_cd_utf16le.reg
fi
