#!/bin/bash

lang=$1
echo $lang

echo installing $lang files...
cp -R "tmp/$lang/"* "INFOGRAM/SHADOW.CD/"

mv __support/app dosbox_conf
rm -f -r app commonappdata/ DOSBOX/ __redist/ gog* __support/ tmp/

cd dosbox_conf

sed -i 's=..\\=../=g' dosbox_sotc_single.conf

sed -i 's/fullscreen=true/fullscreen=false/g' dosbox_sotc.conf
sed -i 's/fulldouble=false/fulldouble=true/g' dosbox_sotc.conf
sed -i 's/output=overlay/output=opengl/g' dosbox_sotc.conf
sed -i 's/aspect=false/aspect=true/g' dosbox_sotc.conf

