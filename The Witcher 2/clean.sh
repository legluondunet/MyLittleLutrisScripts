#!/bin/bash

mydocspath=$(grep -m1 "Personal" user.reg)
echo $mydocspath
mydocsname=$(echo "${mydocspath}" | cut -d '\' -f7 | tr -d '"')
echo $mydocsname

cd "drive_c/GOG Games"
mv app "The Witcher 2"
cd "The Witcher 2"
rm -f -r ../tmp __support goggame-1207658930.* webcache.zip
destpath="../../users/$USER/$mydocsname/Witcher 2/Config"
mkdir -p "$destpath"
ls "$destpath"
echo $destpath
cp -r bin/config "$destpath"
