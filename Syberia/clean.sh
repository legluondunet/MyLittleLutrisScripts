#!/bin/bash

lang=$1
echo $lang

cd drive_c
mkdir "GOG Games"
mv Syberia "GOG Games"
cd "GOG Games/Syberia"
mv "__support/userdocs/Syberia Saves" .
rm -f -r gog* webcache.zip __support


cd ../../tmp/$lang
echo installing $lang files...
cp -R * "../../GOG Games/Syberia/"


rm -f -r ../../tmp
