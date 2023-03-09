#!/bin/bash

cdpath="$1"

if [ ! -d "drive_c/Program Files/Starcraft" ]
then
cd "drive_c/Program Files"
ln -s "../Program Files (x86)/Starcraft" "Starcraft"
echo 'ln -s "../Program Files (x86)/Starcraft" "Starcraft"'
else
cd "drive_c/Program Files (x86)"
ln -s "../Program Files/Starcraft" "Starcraft"
echo 'ln -s "../Program Files/Starcraft" "Starcraft"'
fi
cd 
sed -i -e 's/fullscreen=.*/fullscreen=true/' -e 's/windowed=.*/windowed=true/' -e 's/maintas=.*/maintas=true/' -e 's/adjmouse=.*/adjmouse=true/' "drive-c//Program Files/Starcraft/ddraw.ini"
find "$cdpath/"* -iname install.exe | xargs -I {} cp {} starcraft.mpq
