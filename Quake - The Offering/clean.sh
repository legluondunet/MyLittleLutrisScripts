#!/bin/bash

##################
# Jeu Principal  #
##################

cd drive_c/Epsilon/id1
mv PAK0.PAK PAK0.PAK.DEMO
cp ../../tmp/app/id1/PAK* .
mkdir -p sound/cdtracks

cd ../../tmp/app/
./bchunk game.gog game.cue track0 -w
mv *.wav ../../Epsilon/id1/sound/cdtracks

##################
# Mission pack 1 #
##################

./bchunk gamea.gog gamea.cue track0 -w
./7z x track001.iso -ogamea
mkdir -p gamea/HIPNOTIC/sound/cdtracks
mv *.wav gamea/HIPNOTIC/sound/cdtracks
mv gamea/HIPNOTIC/* ../../Epsilon/hipnotic/


##################
# Mission pack 2 #
##################

./bchunk gamed.gog gamed.cue track0 -w
./7z x track001.iso -ogamed
mkdir -p gamed/ROGUE/sound/cdtracks
mv *.wav gamed/ROGUE/sound/cdtracks
mv gamed/ROGUE/* ../../Epsilon/rogue/

