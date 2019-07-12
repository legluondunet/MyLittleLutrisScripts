#!/bin/bash

w=$1
h=$2
wb=$(echo 'obase=16;' $w | bc)
hb=$(echo 'obase=16;' $h | bc)

echo $w en hexa: $wb soit ${#wb} caractères
echo $h en hexa: $hb soit ${#hb} caractères


sed -i 's/"Width"=dword:*/"Width"=dword:'$wb'/' drive_c/tmp/fp.reg
sed -i 's/"Height"=dword:*/"Height"=dword:'$hb'/' drive_c/tmp/fp.reg
