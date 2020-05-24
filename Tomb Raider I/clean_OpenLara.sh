#!/bin/bash

./bin2iso game.cue -c GAME.GOG
./bin2iso game.cue
if [ -f "GAME-01.iso" ]
then
cd=GAME-01.iso 
else  
cd=GAME.GOG
fi
echo $cd
./7z x -y $cd

rm -f -r Data.now DOSBOX EXTRAS EXTRAS PATCHES INFO __support 3dfxSpl2.dll *.DLL *.dll Autorun.inf goggame* webcache.zip Setup* Support.ico *.ocx *.OCX glide* INSTALL.* HMI* DOS4GW.EXE TOMBPATH.TXT tr1setup.exe VDMSound2[1].1.0.exe 7z bchunk bin2iso cdrdao;

cd audio
find . -type f -name 'Track*' | while read FILE ; do
    newfile="$(echo ${FILE} |sed -e 's/Track/track_/')" ;
    mv "${FILE}" "${newfile}" ;
done 
