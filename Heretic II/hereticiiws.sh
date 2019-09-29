#!/bin/bash

# 80 02 00 00 E0 01 = resolution 640 x 480
# 640 dec = 02 80 hex = 80 02 reversed order byte
# 480 dec = 01 E0 hex = E0 01 reversed order byte
# to replace 640 x 480 resolution by 1920x1080:
# 1920 dec = 0780 hex = reverse it and get 8007
# 1080 dec = 0438 hex = reverse it and get 3804
# insert between them separator "0000"
# and we finally get
# 80 07 00 00 38 04 for video mode 3 (640x480)

w=$1
h=$2
wb=$(echo 'obase=16;' $w | bc)
hb=$(echo 'obase=16;' $h | bc)

echo $w en hexa: $wb soit ${#wb} caractères
echo $h en hexa: $hb soit ${#hb} caractères

if [ ${#wb} = "1" ]; then wb="000$wb"
elif [ ${#wb} = "2" ]; then wb="00$wb"
elif [ ${#wb} = "3" ]; then wb="0$wb"
fi

echo wb est à présent égal à $wb

if [ ${#hb} = "1" ]; then hb="000$hb"
elif [ ${#hb} = "2" ]; then hb="00$hb"
elif [ ${#hb} = "3" ]; then hb="0$hb"
fi

echo hb est à présent égal à $hb

wb1=$(echo $wb |cut -c1-2)
wb2=$(echo $wb |cut -c3-4)
hb1=$(echo $hb |cut -c1-2)
hb2=$(echo $hb |cut -c3-4)

echo "Maintenant il faut remplacer 80 02 00 00 E0 01 (video mode 3 resolution 640 x 480) par $wb2 $wb1 00 00 $hb2 $hb1 (video mode 3 aura à présent une resolution de $w x $h)"


if [ -f "HERETICIICDL/heretic2" ]; then 
echo "installation Linux présente"
cd HERETICIICDL/
cp heretic2 heretic2.ori
echo sed -i -e 's/\x80\x02\x00\x00\xE0\x01/\x'$wb2'\x'$wb1'\x00\x00\x'$hb2'\x'$hb1'/g' heretic2
sed -i -e 's/\x80\x02\x00\x00\xE0\x01/\x'$wb2'\x'$wb1'\x00\x00\x'$hb2'\x'$hb1'/g' heretic2
fi

if [ -f "drive_c/Program Files (x86)/Heretic II/quake2.dll" ]; then
echo "installation Windows présente"
cd "drive_c/Program Files (x86)/Heretic II/"
cp quake2.dll quake2.dll.ori
echo sed -i -e 's/\x80\x02\x00\x00\xE0\x01/\x'$wb2'\x'$wb1'\x00\x00\x'$hb2'\x'$hb1'/g' quake2.dll
sed -i -e 's/\x80\x02\x00\x00\xE0\x01/\x'$wb2'\x'$wb1'\x00\x00\x'$hb2'\x'$hb1'/g' quake2.dll
fi
