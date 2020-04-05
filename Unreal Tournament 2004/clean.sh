#!/bin/bash

width=$1
hight=$2

echo "la résolution du bureau est $width x $height"

cd drive_c/GOG Games/Unreal Tournament 2004/System/"

sed -i "s/FullscreenViewportX.*/FullscreenViewportX=$width/g" Default.ini
sed -i "s/FullscreenViewportY.*/FullscreenViewportY=$heigth/g" Default.ini
sed -i "s/UseVSync=False/UseVSync=True/g" Default.ini
# UseDefaultDriver=False

cat ../../../../system.reg |grep "CDKey" | cut -c10-32 > cdkey

cd ..
rm -f -r gog* *.lnk support.ico unins000.* webcache.zip
