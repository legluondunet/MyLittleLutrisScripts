#!/bin/bash

lang=$1
cdpath=$2

cd "drive_c/Program Files (x86)/Microsoft Games/Age of Empires"

ls | grep -iw avi | xargs rm -fr
ls | grep -i empires.exe | xargs -I {} mv {} empires.exe.bak
ls | grep -i empiresx.exe | xargs -I {}  mv {} empiresx.exe.bak
ls | grep -i language.dll | xargs -I {}  mv {} language.dll.bak

dirtmp="../../../tmp"
cp "$dirtmp/exe/"* .
cp "$dirtmp/$lang/"* .
echo "$dirtmp/exe/" "$dirtmp/$lang/"
mkdir avi
cp "$cdpath/game/avi/"* avi/

