#!/bin/bash

w=$1
h=$2
file=$3

wb=$(echo 'obase=16;' $w | bc)
hb=$(echo 'obase=16;' $h | bc)

echo $w en hexa: $wb soit ${#wb} caractères
echo $h en hexa: $hb soit ${#hb} caractères

wbf=$(printf "%08d\n" $wb)
hbf=$(printf "%08d\n" $hb)

echo "importation de la résolution en hexadécimale dans la base de registre: " $wbf " x " $hbf

cd drive_c/tmp/

if [ $file == "warcraft_iii_cd_utf8.reg" ]; then
echo "fichier reconnu: warcraft_iii_cd_utf8.reg"
echo "la variable file: " $file
sed -i -e 's/"reswidth"\=dword\:.*/"reswidth"\=dword\:'$wb'/' -e 's/"resheight"\=dword\:.*/"resheight"\=dword\:'$hb'/' $file
fi

if [ $file == "warcraft_iii_ptr_utf8.reg" ]; then
echo "fichier reconnu: warcraft_iii_ptr_utf8.reg"
echo "la variable file: " $file
sed -i -e 's/"windowwidth"\=dword\:.*/"windowwidth"\=dword\:'$wbf'/' -e 's/"windowheight"\=dword\:.*/"windowheight"\=dword\:'$hbf'/' -e 's/"reswidth"\=dword\:.*/"reswidth"\=dword\:'$wbf'/' -e 's/"resheight"\=dword\:.*/"resheight"\=dword\:'$hbf'/' $file
fi

iconv -f utf-8 -t utf16le $file -o warcraft_iii.reg

