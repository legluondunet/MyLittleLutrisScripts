#!/bin/bash

lang=$1
echo $lang

cp -R -f __support/app/* .
mkdir dosbox_conf
mv dosboxAlone1* dosbox_conf/

echo installing $lang files...

for i in {0,1,2,3,4} 
do
	sed -i -e 's/\x30\x0'$i'\x04\x03/\x30\x0'$lang'\x04\x03/g' "INDARK/INDARK2.CFG"
	sed -i -e 's/\x30\x0'$i'\x04\x03/\x30\x0'$lang'\x04\x03/g' "JACK/INDARK2.CFG"
done

rm -f -r app commonappdata/ DOSBOX/ __redist/ __support/ tmp/ gog*

cd dosbox_conf

sed -i 's/fullscreen=true/fullscreen=false/g' dosboxAlone1.conf
sed -i 's/fulldouble=false/fulldouble=true/g' dosboxAlone1.conf
sed -i 's/output=overlay/output=opengl/g' dosboxAlone1.conf
sed -i 's/aspect=false/aspect=true/g' dosboxAlone1.conf

sed -i 's=c:==g' dosboxAlone1_single.conf
sed -i 's/overlay/&\nc:/g' dosboxAlone1_single.conf
sed -i 's=..\\=../=g' dosboxAlone1_single.conf

