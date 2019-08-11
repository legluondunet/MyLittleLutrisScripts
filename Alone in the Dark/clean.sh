#!/bin/bash

rm -f -r app commonappdata/ DOSBOX/ __redist/ __support/ tmp/ gog*

mkdir Dosbox
mv dosboxA* Dosbox
cd Dosbox

sed -i 's/fullscreen=true/fullscreen=false/g' dosboxAlone1.conf
sed -i 's/fulldouble=false/fulldouble=true/g' dosboxAlone1.conf
sed -i 's/output=overlay/output=opengl/g' dosboxAlone1.conf
sed -i 's/aspect=false/aspect=true/g' dosboxAlone1.conf

sed -i 's=c:==g' dosboxAlone1_single.conf
sed -i 's/overlay/&\nc:/g' dosboxAlone1_single.conf
sed -i 's=..\\=../=g' dosboxAlone1_single.conf

