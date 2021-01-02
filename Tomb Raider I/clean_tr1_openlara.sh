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

mkdir video
mv FMV video/1

cd DATA
for file in *.PCX; do echo mv "$file" "${file/PCX/PNG}"; mv "$file" "${file/PCX/PNG}"; done;
cp TITLEH.PNG AMERTIT.PNG
cd ..
mkdir level
mv DATA level/1

rm -f -r Data.now DOSBOX EXTRAS EXTRAS PATCHES __support 3dfxSpl2.dll *.DLL *.dll Autorun.inf goggame* webcache.zip Setup* Support.ico *.ocx *.OCX glide* INSTALL.* HMI* DOS4GW.EXE TOMBPATH.TXT tr1setup.exe VDMSound2[1].1.0.exe *.mp3 GAME* TOMB* game.cue 7z bchunk bin2iso cdrdao toc2cue about* DOCS FONTS SHADERS TOOLS dosbox* gogwrap.exe installscript.vdf std*;

cd audio/1
find . -type f -name 'Track*' | while read FILE ; do
	newfile="$(echo ${FILE} |sed -e 's/Track/track_/')"
	mv "${FILE}" "${newfile}"
done 

LD_LIBRARY_PATH=libs ./flac -d *.flac

for file in *.wav; do echo mv "$file" "${file/wav/ogg}"; mv "$file" "${file/wav/ogg}"; done;

rm -f -r *.flac libs cdparanoia flac lame metaflac about_audiotools.txt
cd ../..

#for i in `find . -type f -iname "*.pdf" -o -iname "*.doc" -o -iname "*.docx" -o -iname "*.txt"`;
#do
#  echo "$i"
#done

find . -type f -iname "*.pdf" -o -iname "*.doc" -o -iname "*.docx" -o -iname "*.txt" | xargs -d '\n' cp -t INFO
mv INFO docs

