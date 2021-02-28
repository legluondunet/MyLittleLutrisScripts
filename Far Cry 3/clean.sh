#!/bin/bash

rwidth=$1
rheight=$2

echo rwidth est égal à $rwidth
echo rheight est égal à $rheight

sed -i -e 's/ResolutionX="0"/ResolutionX="'$rwidth'"/g' -e 's/ResolutionY="0"/ResolutionY="'$rheight'"/g' drive_c/tmp/GamerProfile.xml
mydoc=$(grep -i personal user.reg | grep $USER)
echo mydoc est égal à $mydoc
mydocpath=$(echo ${mydoc##*\\} | cut -d '"' -f 1)
echo mydocpath est égal à $mydocpath
mkdir -p "drive_c/users/"$USER"/""$mydocpath""/My Games/Far Cry 3"
cp "drive_c/tmp/GamerProfile.xml" "drive_c/users/"$USER"/""$mydocpath""/My Games/Far Cry 3/"

