#!/bin/bash

cd level/2
mv TITLE.tr2 TITLE.TR2
	for file in *.PCX
	do
	echo mv "$file" "${file/PCX/png}"
	mv "$file" "${file/PCX/PNG}"
	done
cp TITLE.PNG TITLEUS.PNG
cp MAIN.SFX ../../audio/2

cd ../../audio/2
echo $LD_LIBRARY_PATH
export LD_LIBRARY_PATH=""
	for file in *.ogg
	do 
	newfile="${file/Track/track_}"
	mv $file $newfile
	done
cd ../../video/2

for file in *; do mv -- "$file" "${file^^}"; done

