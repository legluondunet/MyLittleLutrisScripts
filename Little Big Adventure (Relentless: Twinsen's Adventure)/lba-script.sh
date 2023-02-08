#!/bin/bash

rm -f -r *.DLL DOSBOX* SETUP.* *.INI LOADPATS.EXE LBA.D* LBA.CFG LBA.ico LBA1.conf DOS4GW.EXE LaunchLBA1.bat VOX
cd tmp/Common/Music
NUMBERS=$(ls *.mp3|sed -e 's/Track_//g' -e 's/\.mp3//g' -e 's/^0*//'|sort -n -r)
for N in $NUMBERS
do NEW=$(($N - 1))
	if [[ $N != 10 ]]
	then
	N=0$N
	fi
cp Track_$N.mp3 ../../../Track_0$NEW.mp3
done
cd ..
mv Vox Fla ../..
