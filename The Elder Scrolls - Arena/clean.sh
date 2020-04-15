#!/bin/bash
rm -f -r app
mv __support/* .
mv app dosbox_conf
rm -f -r commonappdata/ DOSBOX/ __redist/ __support/ tmp/ goggame-1435828982*

cd dosbox_conf

sed -i -e 's/Mgenmidi.adv/Msbfm.adv/g' -e 's/IOM330/IOM220/g' -e 's/IRQM2/IRQM7/g' dosbox_arena_single.conf

sed -i -e 's/fullscreen=true/fullscreen=false/g' -e 's/fulldouble=false/fulldouble=true/g' -e 's/output=overlay/output=opengl/g' -e 's/aspect=false/aspect=true/g' -e 's/mididevice=default/mididevice=none/g' dosbox_arena.conf

