#!/bin/bash

lang=$1
echo $lang

if [ -d "drive_c" ]; then 
cd drive_c
fi

mkdir "GOG Games"
mv "The Longest Journey" "GOG Games"
cd "GOG Games/The Longest Journey"
rm -f -r app commonappdata __redist station_fix tmp gog* *.dll TLJRegFix.* dxsetup.ini
cd ../..

if [ -d "ResidualVM" ]; then 
cd ResidualVM
mv app/* .
rm -f -r app userappdata
cd ..
fi


if [ "$lang" == "en" ]; then
echo "english version is already installed (default)"
exit
else
cd tmp/$lang
echo installing $lang files...
cp -R * "../../GOG Games/The Longest Journey"
fi
cd ../..
rm -f -r tmp
