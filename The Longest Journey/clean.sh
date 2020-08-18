#!/bin/bash

lang=$1

# TLJ GOG with ResidualVM
if [ -d "app" ]
then
folder="."
rm -f -r app commonappdata __redist station_fix tmp *.dll dxsetup.ini DX_Module.dll goggame* TLJRegFix.* 
fi

# TLJ CD with ResidualVM
if [ -d "TLJCD" ]; then 
folder="TLJCD"
cd "$folder"
rm -f -r *.dll *.cab *.hdr *.tag dset* dx* setup* autorun.inf DATA.TAG directx.inf EngineRoot.exe _inst32i.ex_ _ISDel.exe launcher.exe layout.bin longestjourney.url Setup.exe Uninstall.ini SETUP.INI os.dat lang.dat
cd ..
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



echo la variable lang est "$lang" et folder est "$folder"
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

echo la variable file est "$file"
wget -O tlj_4cd-gog_menus_sub_multi5.7z "$file"
ls tlj_4cd-gog_menus_sub_multi5.7z
7z x tlj_4cd-gog_menus_sub_multi5.7z
cp -r "$lang/"* "$folder"

rm -f -r tlj_4cd-gog_menus_sub_multi5.7z $lang

