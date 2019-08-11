#!/bin/bash

#rm -f -r app/ commonappdata/ DOSBOX/ __redist/ __support/ tmp/ gog*
cd Dosbox
sed -i 's/output=overlay/output=opengl/g' dosbox_warcraft.conf
sed -i 's/fullscreen=true/fullscreen=false/g' dosbox_warcraft.conf
sed -i 's/fulldouble=false/fulldouble=true/g' dosbox_warcraft.conf
for i in dosbox_warcraft_*; do
    sed -i 's=c:=aremplacer=' $i
done
for i in dosbox_warcraft_*; do
    sed -i 's=imgmount d "..\war1.cue" -t iso=c:=' $i
done
for i in dosbox_warcraft_*; do
    sed -i 's=aremplacer=imgmount d "../war1.cue" -t iso=' $i
done
