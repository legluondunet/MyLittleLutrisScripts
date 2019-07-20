#!/bin/bash
cd "drive_c/GOG Games/Tomb Raider 2/audio
for file in Track*.mp3
do
	mv -v "$file" "${file/Track/}"
done
cd ../data
rm -f -r data1.cab data1.hdr DATA.TAG _INST32I.EX_ _ISDel.exe lang.dat layout.bin os.dat setup.bmp setup.ins setup.lid _Setup.dll Setup.exe SETUP.INI _sys1.cab _sys1.hdr _user1.cab _user1.hdr dsetup* data language.dat _* setup.BMP SETUP.EXE
cd ..
rm -f -r __support/ gog* webcache.zip music/*.ogg music/ffmpeg.exe music/ogg2mp3.bat audio/
mv music audio
exit
