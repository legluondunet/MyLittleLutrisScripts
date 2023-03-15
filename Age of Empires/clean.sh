#!/bin/bash

lang=$1
cdpath=$2
aoeversion=$3

cd "drive_c/Program Files (x86)/Microsoft Games/Age of Empires"

find ./ -type d -iname avi -delete
find ./ -type f -iname empires.exe -exec mv {} empires.exe.bak \;
find ./ -type f -iname language.dll -exec mv {} language.dll.bak \;

if [ $aoeversion = "gold" ] || [ $aoeversion = "ror" ]
then
    find ./ -type f -iname empiresx.exe -exec mv {} empiresx.exe.bak \;
else
    echo "Cette version n'est pas une Gold édition ni l'extension ROR"
fi

dirtmp="../../../tmp"

echo "update de la version $aoeversion en $lang"
if [ $aoeversion = "gold" ] || [ $aoeversion = "ror" ]
then
    cp "$dirtmp/exe/"* .
    find ./ -type f -iname empiresx.exe -exec cp {} empiresx1a.exe \;
    cp "../../../aoe1covers/1.bmp" "../../../aoe1.bmp"
elif [ $aoeversion = "standard" ] 
then
    cp "$dirtmp/exe/empires.exe" .
fi

cp "$dirtmp/$lang/"* .
echo "$dirtmp/exe/" "$dirtmp/$lang/"
rm -f -r "$dirtmp"
mkdir avi
avipath=$(find "$cdpath" -type d -iname avi)
echo "$avipath"
cp "$avipath/"* avi/

