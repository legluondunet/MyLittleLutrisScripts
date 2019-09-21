#!/bin/bash

lang=$1

if [ -d "drive_c" ]; then 
cd drive_c
fi

#TLJ GOG ResidualVM + Wine installer
if [ -d "ResidualVM" ]; then 
cd ResidualVM
mv app/* .
rm -f -r app userappdata
cd ..
fi

#TLJ GOG ResidualVM Linux installer:
if [ -d "The Longest Journey" ]; then 
mkdir "GOG Games"
mv "The Longest Journey" "GOG Games"
fi

#TLJ GOG ResidualVM Wine and Linux installer:
if [ -d "GOG Games/The Longest Journey" ]; then 
folder="GOG Games/The Longest Journey"
cd "$folder"
rm -f -r app commonappdata __redist station_fix tmp gog* *.dll TLJRegFix.* dxsetup.ini
cd ../..
fi

#TLJ CD ResidualVM Wine installer:
if [ -d "TLJCD" ]; then 
folder="TLJCD"
cd "$folder"
rm -f -r *.dll *.cab *.hdr *.tag dset* dx* setup* autorun.inf DATA.TAG directx.inf EngineRoot.exe _inst32i.ex_ _ISDel.exe launcher.exe layout.bin longestjourney.url Setup.exe Uninstall.ini SETUP.INI os.dat lang.dat
cd ..
fi

if [ "$lang" != "keep" ]; then
echo installing $lang files...
cp -R "tmp/tlj_4cd_gog_menus_sub_multi5/$lang/"* "$folder"
echo "tmp/tlj_4cd_gog_menus_sub_multi5/$lang/" "$folder"
else
echo "I prefer to keep default install language for menus and subtitles"
fi
rm -f -r tmp
