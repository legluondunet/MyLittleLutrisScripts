#!/bin/bash

width=$1
height=$2
os=$3

if [ $os = "Windows" ]
then
echo Windows
mkdir -p "drive_c/GOG Games"
mv "drive_c/Unreal Tournament 2004" "drive_c/GOG Games"
cd "drive_c/GOG Games/Unreal Tournament 2004/System/"
elif [ $os = "Linux" ]
then
echo Linux
cd System
ls -l
fi

echo "la résolution actuelle est $width x $height"
echo "modification de la configuration"

sed -i "s/RenderDevice=.*/RenderDevice=OpenGLDrv.OpenGLRenderDevice/g" Default.ini
sed -i "s/FullscreenViewportX.*/FullscreenViewportX=$width/g" Default.ini
sed -i "s/FullscreenViewportY.*/FullscreenViewportY=$height/g" Default.ini
sed -i "s/UseVSync=False/UseVSync=True/g" Default.ini
sed -i "s/UseDefaultDriver=True/UseDefaultDriver=False/g" Default.ini

echo "Create cdkey file for Linux version"

echo 3QHVC-DHA9K-A84RE-KYRT4 > cdkey

cd ..

rm -f -r __redist __support tmp goggame-1207658691.* app commonappdata
