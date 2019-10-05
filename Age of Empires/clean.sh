#!/bin/bash

lang=$1
cdpath=$2
aoeversion=$3

cd "drive_c/Program Files (x86)/Microsoft Games/Age of Empires"

ls | grep -iw avi | xargs rm -fr
ls | grep -i empires.exe | xargs -I {} mv {} empires.exe.bak
ls | grep -i language.dll | xargs -I {}  mv {} language.dll.bak

if [ $aoeversion = "gold" ] 
then
ls | grep -i empiresx.exe | xargs -I {}  mv {} empiresx.exe.bak
else
echo "Cette version n'est pas une Gold édition"
fi

dirtmp="../../../tmp"

echo "update de la version $aoeversion en $lang"
if [ $aoeversion = "gold" ] 
then
cp "$dirtmp/exe/"* .
elif [ $aoeversion = "standard" ] 
then
cp "$dirtmp/exe/empires.exe" .
fi

cp "$dirtmp/$lang/"* .
echo "$dirtmp/exe/" "$dirtmp/$lang/"
rm -f -r "$dirtmp"
mkdir avi
cp "$cdpath/game/avi/"* avi/

