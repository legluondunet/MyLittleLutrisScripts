#!/bin/bash

rm -f -r DOSBOX/ gog* nglide* support.ico GameuxInstallHelper.dll gfw_high.ico

for i in dosbox_screamer2_*; do
    sed -i 's=.\\=./=g'  $i
    sed -i 's=\.\.=\.=g' $i
done

sed -i 's/fulldouble=false/fulldouble=true/g' dosbox_screamer2.conf
sed -i 's/output=ddraw/output=opengl/g' dosbox_screamer2.conf
sed -i 's/aspect=false/aspect=true/g' dosbox_screamer2.conf

