#!/bin/bash

# 40 01 00 00 F0 00 = resolution 320 x 240
# (40 01 reversed order byte) (01 40 hex) = (320 dec) 
# (F0 00 reversed order byte) (00 F0 hex) = (240 dec) 
# to replace 320 x 240 resolution by 1920x1080:
# 1920 dec = 0780 hex reverse it and get 8007
# 1080 dec = 0438 hex reverse it and get 3804
# insert between them separator "0000"
# and we finally get
# 80 07 00 00 38 04 for video mode 1 (320x240)

# cd heretic2
w=$1
h=$2
wb=$(echo 'obase=16;' $w | bc)
#=780
hb=$(echo 'obase=16;' $h | bc)
#=438

echo $w en hexa: $wb
echo $h en hexa: $hb

echo $w w a ${#w} caractères
echo $wb wb a ${#wb} caractères
echo $h h a ${#h} caractères
echo $hb hb a ${#hb} caractères

if [ ${#wb} = "1" ]; then wb="000$wb"
elif [ ${#wb} = "2" ]; then wb="00$wb"
elif [ ${#wb} = "3" ]; then wb="0$wb"
fi
echo $wb ${#wb}

if [ ${#hb} = "1" ]; then hb="000$hb"
elif [ ${#hb} = "2" ]; then hb="00$hb"
elif [ ${#hb} = "3" ]; then hb="0$hb"
fi
echo $hb ${#hb}

wb1=$(echo $wb |cut -c1-2)
wb2=$(echo $wb |cut -c3-4)
hb1=$(echo $hb |cut -c1-2)
hb2=$(echo $hb |cut -c3-4)
echo $wb1 $wb2 $hb1 $hb2

echo "Maintenant il faut remplacer 40 01 00 00 F0 00 (video mode 1 resolution 320 x 240) par $wb2 $wb1 00 00 $hb2 $hb1 (video mode 1 aura à présent une resolution de $w x $h)"

if [ -f "heretic2.ori" ]; then
    echo "heretic2.ori existe"
else
echo "ne peut trouver le fichier heretic2.ori"
cp heretic2 heretic2.ori
fi
rm -f -r heretic2
cp heretic2.ori heretic2
echo sed -i -e 's/\x40\x01\x00\x00\xF0\x00/\x$wb2\x$wb1\x00\x00\x$hb2\x$hb1/g' heretic2
sed -i -e 's/\x40\x01\x00\x00\xF0\x00/\x'$wb2'\x'$wb1'\x00\x00\x'$hb2'\x'$hb1'/g' heretic2
