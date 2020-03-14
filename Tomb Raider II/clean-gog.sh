#!/bin/bash

cd "drive_c/GOG Games/Tomb Raider 2/data"
rm -f -r auto* data1.cab data1.hdr DATA.TAG _INST32I.EX_ _ISDel.exe lang.dat layout.bin os.dat setup.bmp setup.ins setup.lid _Setup.dll Setup.exe SETUP.INI _sys1.cab _sys1.hdr _user1.cab _user1.hdr dsetup* data language.dat _* setup.BMP SETUP.EXE

cd ..
rm -f -r __support/ gog* webcache.zip audio/ 3Dfx MS Doc libogg* libvor* msv* sound.dll

cd ..
cp -r "Tomb Raider 2" "Tomb Raider 2 Golden Mask"

cd "Tomb Raider 2 Golden Mask"
rm -f -r Tomb2.gog "Tomb Raider"* *.BAT manual.pdf CHANGELOG.html COPYING.txt "gamepad profiles" "ExtraOptions" QuickGuide.html readme.txt fmv/* dgVoodoo_original.conf data/*
cp "../Tomb Raider 2/fmv/logo.rpl" fmv/
