#!/bin/bash

lang=$1
echo $lang

echo installing $lang files...

for i in {0,1,2,3,4} 
do
	sed -i -e 's/\x31\x0'$i'\xff\x03/\x31\x0'$lang'\xff\x03/g' "INDARK2/INDARK2.CFG"
done

mv __support/app dosbox_conf
rm -f -r app commonappdata/ DOSBOX/ __redist/ __support/ tmp/ gog*

cd dosbox_conf

sed -i 's=..\\=../=g' dosboxAlone2_single.conf

sed -i 's/fullscreen=true/fullscreen=false/g' dosboxAlone2.conf
sed -i 's/fulldouble=false/fulldouble=true/g' dosboxAlone2.conf
sed -i 's/output=overlay/output=opengl/g' dosboxAlone2.conf
sed -i 's/aspect=false/aspect=true/g' dosboxAlone2.conf

