#!/bin/bash

cd "drive_c/Tomb Raider 2/"
#mv Tomb2.exe Tomb2.bak
rm -f -r 3Dfx Doc audio msvcp90.dll msvcr90.dll sound.dll audiere.dll MS
cd music
#for i in *.mp3; do LD_LIBRARY_PATH=libs ./lame --decode $i "$(basename "$i" .mp3).wav"
#done
ls {2..9}.mp3 | xargs -I {} mv {} 0{}
ls *.mp3 | xargs -I {} mv {} Track{}
#rm -f -r *.mp3 cdparanoia flac lame metaflac versions.txt libs

cd "../../Tomb Raider 2 Golden Mask"
cp -r "../Tomb Raider 2/"* .
rm -f -r data/ fmv/ "gamepad profiles/"
cp  "../Tomb Raider 2/fmv/LOGO.RPL" fmv

