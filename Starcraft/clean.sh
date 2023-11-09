#!/bin/bash

# Depending on the CD edition, the game files are installed in the "c:\Program Files\Starcraft" or "c:\Program Files (x86)\Starcraft" directory. 
# Result; Lutris may not find the executable and this makes operations on the game directory complicated. 
# Solution: create a symbolic link from the directory where the game was installed to the second possible installation directory.

if [ ! -d "drive_c/Program Files/Starcraft" ]
then
cd "drive_c/Program Files"
ln -s "../Program Files (x86)/Starcraft" "Starcraft"
echo 'ln -s "../Program Files (x86)/Starcraft" "Starcraft"'
elif [ ! -d "drive_c/Program Files (x86)/Starcraft" ]
then
cd "drive_c/Program Files (x86)"
ln -s "../Program Files/Starcraft" "Starcraft"
echo 'ln -s "../Program Files/Starcraft" "Starcraft"'
fi

cd Starcraft

# nocd workaround, copy install.exe file inside main game folder and rename it Starcraft.mpq
cdpath="$1"
if [ $cdpath ]
then
find $cdpath/* -iname install.exe | xargs -I {} cp {} Starcraft.mpq
echo $cdpath'/* -iname install.exe | xargs -I {} cp {} starcraft.mpq'
chmod +rw StarCraft.mpq
fi

#configure cnc-draw
mv ../../tmp/* .
sed -i -e 's/fullscreen=.*/fullscreen=true/' -e 's/windowed=.*/windowed=true/' -e 's/maintas=.*/maintas=true/' -e 's/adjmouse=.*/adjmouse=true/' ddraw.ini;
