#!/bin/bash

lang=$1
echo installing $lang files
cp -f tmp/$lang/* TREKCD


mv __support/app dosbox_conf
rm -f -r app DOSBOX/ __support/ gog* __redist tmp commonappdata
cd dosbox_conf

sed -i 's=..\\=../=g' dosbox_st25_single.conf

sed -i 's/fullscreen=true/fullscreen=false/g' dosbox_st25.conf
sed -i 's/fulldouble=false/fulldouble=true/g' dosbox_st25.conf
sed -i 's/output=overlay/output=opengl/g' dosbox_st25.conf
sed -i 's/aspect=false/aspect=true/g' dosbox_st25.conf
sed -i 's/mididevice=default/mididevice=none/g' dosbox_st25.conf
