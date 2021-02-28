#!/bin/bash

rwidth=$1
rheight=$2
lang=$3

echo rwidth est égal à $rwidth
echo rheight est égal à $rheight
echo lang est égal à $lang

sed -i -e 's/ScreenWidth = 0/ScreenWidth = '$rwidth'/g' -e 's/ScreenHeight = 0/ScreenHeight = '$rheight'/g' -e 's/Language = 0/Language = '$lang'/g' drive_c/tmp/CivilizationIV.ini


mydoc=$(grep -i personal user.reg | grep $USER)
echo mydoc est égal à $mydoc
mydocpath=$(echo ${mydoc##*\\} | cut -d '"' -f 1)
echo mydocpath est égal à $mydocpath
mkdir -p "drive_c/users/"$USER"/""$mydocpath""/My Games/Beyond the Sword"
mkdir -p "drive_c/users/"$USER"/""$mydocpath""/My Games/Civ4"
mkdir -p "drive_c/users/"$USER"/""$mydocpath""/My Games/Civ4Colonization"
mkdir -p "drive_c/users/"$USER"/""$mydocpath""/My Games/Warlords"

cp drive_c/tmp/CivilizationIV.ini "drive_c/users/"$USER"/""$mydocpath""/My Games/Beyond the Sword"
cp drive_c/tmp/CivilizationIV.ini "drive_c/users/"$USER"/""$mydocpath""/My Games/Civ4"
cp drive_c/tmp/CivilizationIV.ini "drive_c/users/"$USER"/""$mydocpath""/My Games/Civ4Colonization"
cp drive_c/tmp/CivilizationIV.ini "drive_c/users/"$USER"/""$mydocpath""/My Games/Warlords"

