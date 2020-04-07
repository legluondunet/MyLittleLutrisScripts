#!/bin/bash

width=$1
height=$2

echo "la résolution actuelle est $width x $height"
echo "modification de la configuration"

cd "drive_c/GOG Games/Unreal Tournament 2004/System/"

sed -i "s/FullscreenViewportX.*/FullscreenViewportX=$width/g" Default.ini
sed -i "s/FullscreenViewportY.*/FullscreenViewportY=$heigth/g" Default.ini
sed -i "s/UseVSync=False/UseVSync=True/g" Default.ini
sed -i "s/UseDefaultDriver=True/UseDefaultDriver=False/g" Default.ini

echo "Create cdkey file for Linux version"

time=1
while [ $time -le 30 ] && [ -z "$cdkey" ]
do
	echo "waiting for cdkey since "$time" s"
	sleep 1s
	time=$(( $time + 1 ))
cdkey=$(cat "../../../../system.reg" |grep "CDKey" | cut -c10-32)
done

echo $cdkey > cdkey

cd ..
rm -f -r gog* *.lnk support.ico unins000.* webcache.zip

