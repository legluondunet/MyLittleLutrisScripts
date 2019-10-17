#!/bin/bash

cdpath=$1

if [ $(find "$cdpath" |grep -i "aoeinst.exe") ]
then
echo "found aoeinst.exe"
setupfile="aoeinst.exe"
elif [ $(find "$cdpath" |grep -i "aoesetup.exe") ]
then
echo "found aoesetup.exe"
setupfile="aoesetup.exe"
else
echo "AOE setup file not found"
exit
fi
echo "$cdpath"/"$setupfile">aoeinstall.bat

