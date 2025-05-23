#!/bin/bash

# Depending on the CD edition, the Starcraft game files are installed in the "c:\Program Files\Starcraft" or "c:\Program Files (x86)\Starcraft" directory. 
# Result; Lutris may not find the executable and this makes operations on the game directory complicated. 
# Solution: create a symbolic link from the directory where the game was installed to the second possible installation directory.

# unset Lutris LD_LIBRARY_PATH that can cause libraries incompatibility on some Linux distribution
unset LD_LIBRARY_PATH

# some Starcraft cd install files to c:\Program Files\Starcraft, others cd version to c:\Program Files (x86)\Starcraft
# need to create an unique path for all different install to install update and cnc-draw
if [ -d "drive_c/Program Files (x86)/Starcraft" ] && [ ! -d "drive_c/Program Files/Starcraft" ]
then
cd "drive_c/Program Files"
ln -s "../Program Files (x86)/Starcraft" "Starcraft"
echo 'ln -s "../Program Files (x86)/Starcraft" "Starcraft"'
elif [ -d "drive_c/Program Files/Starcraft" ] && [ ! -d "drive_c/Program Files (x86)/Starcraft" ]
then
cd "drive_c/Program Files (x86)"
ln -s "../Program Files/Starcraft" "Starcraft"
echo 'ln -s "../Program Files/Starcraft" "Starcraft"'
elif [ ! -d "drive_c/Program Files/Starcraft" ] && [ ! -d "drive_c/Program Files (x86)/Starcraft" ]
then
echo "can not find Starcraft install"
exit
fi

cd Starcraft

# nocd workaround, copy install.exe file inside main game folder and rename it Starcraft.mpq
cdpath="$1"
if [ $cdpath ]
then
find "$cdpath/"* -iname install.exe -type f -not -ipath '*mindspr*' | xargs -I {} cp "{}" Starcraft.mpq
echo $cdpath'/"* -iname install.exe -type f -not -ipath '*mindspr*' | xargs -I {} cp {} Starcraft.mpq'
chmod +rw Starcraft.mpq
fi
