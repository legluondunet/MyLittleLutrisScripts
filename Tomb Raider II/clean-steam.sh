#!/bin/bash

mkdir -p "drive_c/Tomb Raider 2 Golden Mask/"

cd "drive_c/Tomb Raider 2/"
rm -f -r 3Dfx Doc audio msvcp90.dll msvcr90.dll sound.dll audiere.dll MS installscript.vdf QuickGuide.html

cd data
rm -f -r autorun.* *.cab setup.* *.dll *.EXE _I* SETUP* data DATA.TAG lang* layout.bin os.dat

cd ../music
ls {2..9}.mp3 | xargs -I {} mv {} 0{}
ls *.mp3 | xargs -I {} mv {} Track{}

cd "../../Tomb Raider 2 Golden Mask"
cp -r "../Tomb Raider 2/"* .
rm -f -r data/ fmv/* ExtraOptions dgVoodoo_original.conf Tomb2.steam data/*
find "../Tomb Raider 2/fmv" -iname "LOGO.RPL" -exec cp "{}" fmv/ \;


