#!/bin/bash
#wineconsole ogg2mp3.bat
for file in Track*.mp3
do
	mv -v "$file" "${file/Track/}"
done
cd .. 
mkdir tr2mainreg
mv *.reg tr2mainreg
rm -f -r __support/ gog* webcache.zip music/*.ogg music/ffmpeg.exe music/ogg2mp3.bat audio/
mv music audio
exit
