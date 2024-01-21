#!/bin/bash

resX=$1
resY=$2
echo "resX est égal à "$resX" et resY est égal à "$Y"."

# 1 - extraction de la bande sonore à partir des cd originaux
cd drive_c/tmp

# id1  #
mkdir -p ../quake/id1/sound/cdtracks
./bchunk ../quake/game.gog ../quake/game.cue track0 -w
mv *.wav ../quake/id1/sound/cdtracks

# mp1 - hipnotic  #
mkdir -p ../quake/hipnotic/sound/cdtracks
./bchunk ../quake/gamea.gog ../quake/gamea.cue track0 -w
mv *.wav ../quake/hipnotic/sound/cdtracks

# mp2 - rogue #
mkdir -p ../quake/rogue/sound/cdtracks
./bchunk ../quake/gamed.gog ../quake/gamed.cue track0 -w
mv *.wav ../quake/rogue/sound/cdtracks

#for dest in hipnotic rogue abyss
#do cp id1/config.cfg $dest
#done

# 2 - personnalisation de la  configuration
cd ../quake
sed -e s/\"vid_width\".*/\"vid_width\"\ \"$resX\"/ -e s/\"vid_height\".*/\"vid_height\"\ \"$resY\"/ -e '/\"bgmvolume\"\ \"0.500000\"/d' -e '1 i\"bgmvolume\"\ \"0.550000\"' id1/config.cfg mg1/config.cfg dop/config.cfg hipnotic/config.cfg honey/config.cfg;

# 3 - fichiers d'Abyss
cp rogue/config.cfg abyss
mv ../tmp/tmp/mod4/abyss/maps abyss
mv ../tmp/tmp/mod4/abyss/sound abyss
