#!/bin/bash
rm -f -r app/ commonappdata/ DOSBOX/ __redist/ __support/ tmp/ goggame-1207658919.* 
sed -i 's=Music\\=Music/=g' game.ins
cd Dosbox
mv dosboxRayman.conf Rayman_Forever_dosbox.conf
mv dosboxRayman_single.conf Rayman_Forever_single_dosbox.conf
sed -i 's=..\\=../=g' Rayman_Forever_single_dosbox.conf
sed -i 's/output=overlay/output=opengl/g' Rayman_Forever_dosbox.conf
sed -i 's/fullscreen=true/fullscreen=false/g' Rayman_Forever_dosbox.conf
sed -i 's/core=normal/core=auto/g' Rayman_Forever_dosbox.conf
sed -i 's/cycles=80000/cycles=auto/g' Rayman_Forever_dosbox.conf
sed -i 's/mididevice=default/mididevice=none/g' Rayman_Forever_dosbox.conf
