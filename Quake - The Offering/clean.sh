#!/bin/bash

##################
# Jeu Principal  #
##################

cd drive_c/Epsilon/id1
mv PAK0.PAK PAK0.PAK.DEMO
cp ../../tmp/app/id1/PAK* .
mkdir music

cd ../../tmp/app/
./bchunk game.gog game.cue track0 -w
mv *.wav ../../Epsilon/id1/music

##################
# Mission pack 1 #
##################

./bchunk gamea.gog gamea.cue track0 -w
./7z x track001.iso -ogamea
mkdir gamea/HIPNOTIC/music
mv *.wav gamea/HIPNOTIC/music
mv gamea/HIPNOTIC/* ../../Epsilon/hipnotic/


##################
# Mission pack 2 #
##################

./bchunk gamed.gog gamed.cue track0 -w
./7z x track001.iso -ogamed
mkdir gamed/ROGUE/music
mv *.wav gamed/ROGUE/music
mv gamed/ROGUE/* ../../Epsilon/rogue/

