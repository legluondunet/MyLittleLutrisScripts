#!/bin/bash

width=$1
height=$2

##################
# Jeu Principal  #
##################

cd Epsilon/id1
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
mv ../../Epsilon/hipnotic/CONFIG.CFG ../../Epsilon/hipnotic/CONFIG.BAK


##################
# Mission pack 2 #
##################

./bchunk gamed.gog gamed.cue track0 -w
./7z x track001.iso -ogamed
mkdir -p gamed/ROGUE/sound/cdtracks
mv *.wav gamed/ROGUE/sound/cdtracks
mv gamed/ROGUE/* ../../Epsilon/rogue/

cd ../../Epsilon
sed -i -e "/vid_width/d" -e "/vid_height/d" -e '/vid_vsync/d' -e '/crosshair/d' id1/config.cfg
sed -i -e '$a \"vid_width" "'$width'"' -e '$a \"vid_height" "'$height'"' -e '$a \"vid_vsync" "1"' -e '$a \"crosshair" "1"' id1/config.cfg

for dest in hipnotic rogue abyss
do cp id1/config.cfg $dest
done

cd ..
if [ -d tmp ]
then
#rm -f -r tmp
fi

