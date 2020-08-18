#!/bin/bash

lang=$1

# TLJ GOG
if [ -d "app" ]
then
rm -f -r app commonappdata __redist station_fix tmp *.dll dxsetup.ini DX_Module.dll goggame* TLJRegFix.* 
fi

#if [ -d "drive_c" ]; then 
#cd drive_c
#fi

#TLJ GOG ResidualVM + Wine installer
#if [ -d "ResidualVM" ]; then 
#cd ResidualVM
#mv app/* .
#rm -f -r app userappdata
#cd ..
#fi

#TLJ GOG ResidualVM Wine and Linux installer:
#if [ -d "GOG Games/The Longest Journey" ]; then 
#folder="GOG Games/The Longest Journey"
#cd "$folder"
#rm -f -r app commonappdata __redist station_fix tmp gog* *.dll TLJRegFix.* dxsetup.ini
#cd ../..
#fi

#TLJ CD ResidualVM Wine installer:
#if [ -d "TLJCD" ]; then 
#folder="TLJCD"
#cd "$folder"
#rm -f -r *.dll *.cab *.hdr *.tag dset* dx* setup* autorun.inf DATA.TAG directx.inf EngineRoot.exe _inst32i.ex_ _ISDel.exe launcher.exe layout.bin longestjourney.url Setup.exe Uninstall.ini SETUP.INI os.dat lang.dat
#cd ..
#fi

echo $lang
if [ "$lang" = "keep" ]
then
echo "I prefer to keep default install language for menus and subtitles"
exit
elif [ "$lang" = "fr" ]
then
file="https://www.dropbox.com/s/5p95ijpbr3b1ox6/tlj_4cd-gog_menus_sub_fr.7z?dl=1"
elif [ "$lang" = "ge" ]
then
file="https://www.dropbox.com/s/oyeh1zzpgl5fwkm/tlj_4cd-gog_menus_sub_ge.7z?dl=1"
elif [ "$lang" = "it" ]
then
file="https://www.dropbox.com/s/jybo8ft18bhu5os/tlj_4cd-gog_menus_sub_it.7z?dl=1"
elif [ "$lang" = "sp" ]
then 
file="https://www.dropbox.com/s/vcx8l7vry3kdmm2/tlj_4cd-gog_menus_sub_sp.7z?dl=1"
fi

echo "$lang" "$folder" "$file"
wget -O tlj_4cd-gog_menus_sub_multi5.7z "$file"

#rm -f -r tmp tlj_4cd-gog_menus_sub_multi5.7z
