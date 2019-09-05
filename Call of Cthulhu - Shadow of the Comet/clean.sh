#!/bin/bash

mv __support/app dosbox_conf
rm -f -r app commonappdata/ DOSBOX/ __redist/ tmp/ gog* __support/
cd dosbox_conf

sed -i 's=..\\=../=g' dosbox_sotc_single.conf

sed -i 's/fullscreen=true/fullscreen=false/g' dosbox_sotc.conf
sed -i 's/fulldouble=false/fulldouble=true/g' dosbox_sotc.conf
sed -i 's/output=surface/output=opengl/g' dosbox_sotc.conf
sed -i 's/aspect=false/aspect=true/g' dosbox_sotc.conf

