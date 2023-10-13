#!/bin/bash

width=$1
height=$2
os=$3

if [ $os = "Windows" ]
then
echo Windows
cd "drive_c/GOG Games/Unreal Tournament 2004/System/"
elif [ $os = "Linux" ]
then
echo Linux
cd System
rm -f -r *.dll
echo "Create cdkey file for Linux version"
echo 3QHVC-DHA9K-A84RE-KYRT4 > cdkey
fi

echo "la résolution actuelle est $width x $height"
sed -i "s/RenderDevice=.*/RenderDevice=OpenGLDrv.OpenGLRenderDevice/g" Default.ini
sed -i "s/FullscreenViewportX.*/FullscreenViewportX=$width/g" Default.ini
sed -i "s/FullscreenViewportY.*/FullscreenViewportY=$height/g" Default.ini
sed -i "s/WindowedViewportX.*/WindowedViewportX=$width/g" Default.ini
sed -i "s/WindowedViewportY.*/WindowedViewportY=$height/g" Default.ini
sed -i "s/UseDefaultDriver=True/UseDefaultDriver=False/g" Default.ini
#sed -i "s/UseVSync=False/UseVSync=True/g" Default.ini

cd ..

rm -f -r __redist __support tmp goggame-1207658691.* app commonappdata webcache.zip
