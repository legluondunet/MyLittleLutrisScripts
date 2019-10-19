#!/bin/bash

lang=$1
cdpath=$2
aoeversion=$3

cd "drive_c/Program Files (x86)/Microsoft Games/Age of Empires"

ls | grep -iw avi | xargs rm -fr
ls | grep -i empires.exe | xargs -I {} mv {} empires.exe.bak
ls | grep -i language.dll | xargs -I {}  mv {} language.dll.bak

if [ $aoeversion = "gold" ] || [ $aoeversion = "ror" ]
then
ls | grep -i empiresx.exe | xargs -I {}  mv {} empiresx.exe.bak
else
echo "Cette version n'est pas une Gold édition ni l'extension ROR"
fi

dirtmp="../../../tmp"

echo "update de la version $aoeversion en $lang"
if [ $aoeversion = "gold" ] || [ $aoeversion = "ror" ]
then
cp "$dirtmp/exe/"* .
cp "../../../aoe1covers/1.bmp" "../../../aoe1.bmp"
elif [ $aoeversion = "standard" ] 
then
cp "$dirtmp/exe/empires.exe" .
fi

cp "$dirtmp/$lang/"* .
echo "$dirtmp/exe/" "$dirtmp/$lang/"
rm -f -r "$dirtmp"
mkdir avi
avipath=$(find "$cdpath" |grep -i -m1 avi)
echo "$avipath"
cp "$avipath/"* avi/

