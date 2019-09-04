#!/bin/bash

mv __support/app dosbox_conf
mv Dosbox/ICE/ .
rm -f -r DOSBOX/ __support/ gog* webcache.zip
cd dosbox_conf

sed -i 's=..\\=../=g' dosbox_poi_single.conf

sed -i 's/fullscreen=true/fullscreen=false/g' dosbox_poi.conf
sed -i 's/fulldouble=false/fulldouble=true/g' dosbox_poi.conf
sed -i 's/fullresolution=original/fullresolution=desktop/g' dosbox_poi.conf
sed -i 's/output=surface/output=opengl/g' dosbox_poi.conf
sed -i 's/aspect=false/aspect=true/g' dosbox_poi.conf

