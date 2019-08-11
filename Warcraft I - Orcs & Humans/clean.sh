#!/bin/bash

rm -f -r app/ commonappdata/ DOSBOX/ __redist/ __support/ tmp/ gog*
cd Dosbox
sed -i 's/output=overlay/output=opengl/g' dosbox_warcraft.conf
sed -i 's/fullscreen=true/fullscreen=false/g' dosbox_warcraft.conf
sed -i 's/fulldouble=false/fulldouble=true/g' dosbox_warcraft.conf
sed -i 's/30000/50000/g' dosbox_warcraft.conf
for i in dosbox_warcraft_*; do
    sed -i 's=c:==g' $i
done
for i in dosbox_warcraft_*; do
    sed -i 's/overlay/&\nc:/g' $i
done
for i in dosbox_warcraft_*; do
    sed -i 's=..\\=../=g' $i
done
