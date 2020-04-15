#!/bin/bash
mkdir dosbox_conf
mv app/*.conf dosbox_conf
rm -f -r app commonappdata/ DOSBOX/ __redist/ __support/ tmp/ gog*
cd dosbox_conf

sed -i 's/Mgenmidi.adv/Msbfm.adv/g' dosbox_arena_single.conf
sed -i 's/IOM330/IOM220/g' dosbox_arena_single.conf
sed -i 's/IRQM2/IRQM7/g' dosbox_arena_single.conf

sed -i 's/fullscreen=true/fullscreen=false/g' dosbox_arena.conf
sed -i 's/fulldouble=false/fulldouble=true/g' dosbox_arena.conf
sed -i 's/output=overlay/output=opengl/g' dosbox_arena.conf
sed -i 's/aspect=false/aspect=true/g' dosbox_arena.conf
sed -i 's/mididevice=default/mididevice=none/g' dosbox_arena.conf
