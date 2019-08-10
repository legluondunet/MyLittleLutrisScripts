#!/bin/bash
cd $GAMEDIR
rm -f -r app/ commonappdata/ DOSBOX/ __redist/ __support/ tmp/ goggame-1207658919.* 
sed -i 's=Music\\=Music/=g' game.ins
cd Dosbox
mv dosboxRayman.conf Rayman_dosbox.conf
mv dosboxRayman_single.conf Rayman_single_dosbox.conf
sed -i 's=..\\=../=g' Rayman_single_dosbox.conf
sed -i 's/output=overlay/output=opengl/g' Rayman_dosbox.conf
sed -i 's/fullscreen=true/fullscreen=false/g' Rayman_dosbox.conf
     
