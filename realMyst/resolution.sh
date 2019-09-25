#!/bin/bash

#9a99 193e 0000 0000 8007 0000 3804 0000 2000 = resolution 1920 x 1080 x 32 bits
#9a99 193e 0000 0000 8007 0000 3804 0000 1000 = resolution 1920 x 1080 x 16 bits
#9a99 193e 0000 0000 9006 0000 1a04 0000 2000 = resolution 1650 x 1080 x 32 bits
#9a99 193e 0000 0000 9006 0000 1a04 0000 1000 = resolution 1650 x 1080 x 16 bits

#1920 dec = 0780 hex = reverse it and get 8007
#1080 dec = 0438 hex = reverse it and get 3804
#1680 dec = 0690 hex = reverse it and get 9006
#1050 dec = 041a hex = reverse it and get 1a04

#2000 = 32 bits
#1000 = 16 bits

w=$1
h=$2

# conversion de la resolution en hexa

wb=$(echo 'obase=16;' $w | bc)
hb=$(echo 'obase=16;' $h | bc)

#calcul du nombre de caractères des résultats hexa

echo $w en hexa: $wb soit ${#wb} caractères
echo $h en hexa: $hb soit ${#hb} caractères

#la resolution hexa doit être égal à 4 caractères, ajout de 0 si besoin

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

#découpage de la résolution en hexa par 2x2 chiffres

wb1=$(echo $wb |cut -c1-2)
wb2=$(echo $wb |cut -c3-4)
hb1=$(echo $hb |cut -c1-2)
hb2=$(echo $hb |cut -c3-4)

#echo "Maintenant il faut remplacer "9a99 193e 0000 0000 .... 0000 .... 0000 1000" par "9a99 193e 0000 0000 $wb2 $wb1 0000 $hb2 $hb1 0000 2000"


cd "drive_c/GOG Games/realMyst/INIT"
echo "00000000: 0700 0000 0000 0000 0200 0000 1800 0000  ................
00000010: 6467 566f 6f64 6f6f 2044 6972 6563 7458  dgVoodoo DirectX
00000020: 2057 7261 7070 6572 0800 0000 6467 566f   Wrapper....dgVo
00000030: 6f64 6f6f 1000 0000 3137 3437 392e 3032  odoo....17479.02
00000040: 2e36 302e 3030 3030 1000 0000 6467 566f  .60.0000....dgVo
00000050: 6f64 6f6f 2054 6e4c 2048 414c 0100 0000  odoo TnL HAL....
00000060: dc1f 0100 0800 0000 0000 b00f 0000 0000  ................
00000070: 0000 0000 0000 0000 0000 0000 0000 0000  ................
00000080: fffe 7e3f 0000 003f 9a99 193e 0000 003f  ..~?...?...>...?
00000090: 9a99 193e 0000 0000 0780 0000 0438 0000  ...>............
000000a0: 2000 0000 6400                           ....d.">dev_mode.dat.hex

sed -i 's/9a99 193e 0000 0000 .... 0000 .... 0000/9a99 193e 0000 0000 '$wb2''$wb1' 0000 '$hb2''$hb1' 0000/g' dev_mode.dat.hex
xxd -r dev_mode.dat.hex > dev_mode.dat
rm -f -r dev_mode.dat.hex
