#!/bin/bash

lang=$1
echo $lang

echo installing $lang files...
for i in {0,1,2,3,4} 
do
	sed -i -e 's/\x30\x0'$i'\x04\x03/\x30\x0'$lang'\x04\x03/g' "INFOGRAM/SHADOW.CD/SHADO_CD.CFG"
	sed -i -e 's/\x30\x0'$i'\x04\x03/\x30\x0'$lang'\x04\x03/g' "CD/SHADO_CD.CFG"
done

mv __support/app dosbox_conf
rm -f -r app commonappdata/ DOSBOX/ __redist/ gog* __support/ tmp/

cd dosbox_conf

sed -i 's=..\\=../=g' dosbox_sotc_single.conf

sed -i 's/fullscreen=true/fullscreen=false/g' dosbox_sotc.conf
sed -i 's/fulldouble=false/fulldouble=true/g' dosbox_sotc.conf
sed -i 's/output=overlay/output=opengl/g' dosbox_sotc.conf
sed -i 's/aspect=false/aspect=true/g' dosbox_sotc.conf
sed -i 's/mididevice=default/mididevice=none/g' dosbox_sotc.conf
