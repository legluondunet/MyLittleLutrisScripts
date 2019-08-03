#!/bin/bash

cd "drive_c/GOG Games/RollerCoaster Tycoon Deluxe"

w=$1
h=$2
lang=$3
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


if [ $lang = "en" ] 
cp RCT.EXE RCT.EXE.PACKED
cp ../../tmp/RCT.EXE.EN RCT.EXE.BAK
elif [ ! -f "RCT.EXE.BAK" ]; then 
cp RCT.EXE RCT.EXE.BAK
elif [ -f "RCT.EXE.BAK" ]; then 
rm -f -r RCT.EXE
cp RCT.EXE.BAK RCT.EXE
fi

echo $lang
if [ $lang = "en" ] 
then
echo version anglaise .15 identifiée
echo "Maintenant il faut remplacer 05 00 00 7E 07 C7 45 FC 00 05 00 par $wb1 $wb2 00 7E 07 C7 45 FC 00 $wb1 $wb2 et 04 00 00 7E 07 C7 45 F4 00 04 00 par $hb1 $hb2 00 7E 07 C7 45 F4 00 $hb1 $hb2 pour l'obtention d'une résolution de $w x $h"
echo 'sed -i -e 's/\x05\x00\x00\x7E\x07\xC7\x45\xFC\x00\x05\x00/\x'$wb1'\x'$wb2'\x00\x7E\x07\xC7\x45\xFC\x00\x'$wb1'\x'$wb2'/g' RCT.EXE'
sed -i -e 's/\x05\x00\x00\x7E\x07\xC7\x45\xFC\x00\x05\x00/\x'$wb1'\x'$wb2'\x00\x7E\x07\xC7\x45\xFC\x00\x'$wb1'\x'$wb2'/g' RCT.EXE
echo 'sed -i -e 's/\x04\x00\x00\x7E\x07\xC7\x45\xF4\x00\x04\x00/\x'$hb1'\x'$hb2'\x00\x7E\x07\xC7\x45\xF4\x00\x'$hb1'\x'$hb2'/g' RCT.EXE'
sed -i -e 's/\x04\x00\x00\x7E\x07\xC7\x45\xF4\x00\x04\x00/\x'$hb1'\x'$hb2'\x00\x7E\x07\xC7\x45\xF4\x00\x'$hb1'\x'$hb2'/g' RCT.EXE
else
echo versions fr,ge,it,sp 1.13 identifiées
echo "Maintenant il faut remplacer 05 00 0F 8E 07 00 00 00 C7 45 FC 00 05 00 par $wb1 $wb2 0F 8E 07 00 00 00 C7 45 FC 00 $wb1 $wb2 et 04 00 00 0F 8E 07 00 00 00 C7 45 F4 00 04 00 par $hb1 $hb2 00 0F 8E 07 00 00 00 C7 45 F4 00 $hb1 $hb2 pour l'obtention d'une résolution de $w x $h"
echo '-i -e 's/\x05\x00\x0F\x8E\x07\x00\x00\x00\xC7\x45\xFC\x00\x05\x00/\x'$wb1'\x'$wb2'\x0F\x8E\x07\x00\x00\x00\xC7\x45\xFC\x00\x'$wb1'\x'$wb2'/g' RCT.EXE'
sed -i -e 's/\x05\x00\x00\x0F\x8E\x07\x00\x00\x00\xC7\x45\xFC\x00\x05\x00/\x'$wb1'\x'$wb2'\x00\x0F\x8E\x07\x00\x00\x00\xC7\x45\xFC\x00\x'$wb1'\x'$wb2'/g' RCT.EXE
echo '-i -e 's/\x04\x00\x00\x0F\x8E\x07\x00\x00\x00\xC7\x45\xF4\x00\x04\x00/\x$hb1\x$hb2\x00\x0F\x8E\x07\x00\x00\x00\xC7\x45\xF4\x00\x$hb1\x$hb2/g' RCT.EXE'
sed -i -e 's/\x04\x00\x00\x0F\x8E\x07\x00\x00\x00\xC7\x45\xF4\x00\x04\x00/\x'$hb1'\x'$hb2'\x00\x0F\x8E\x07\x00\x00\x00\xC7\x45\xF4\x00\x'$hb1'\x'$hb2'/g' RCT.EXE
fi
