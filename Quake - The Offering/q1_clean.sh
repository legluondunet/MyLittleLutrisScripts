#!/bin/bash

resX=$1
resY=$2
echo "resX est égal à "$resX" et resY est égal à "$resY"."

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

# 2 - personnalisation de la  configuration
cd ../quake
sed -i -e s/\"vid_width\".*/\"vid_width\"\ \"$resX\"/ -e s/\"vid_height\".*/\"vid_height\"\ \"$resY\"/ id1/config.cfg mg1/config.cfg dop/config.cfg hipnotic/config.cfg honey/config.cfg
sed -i '/\"bgmvolume\".*\"/d' id1/config.cfg mg1/config.cfg dop/config.cfg hipnotic/config.cfg honey/config.cfg
sed -i '1 i\"bgmvolume\"\ \"0.550000\"' id1/config.cfg mg1/config.cfg dop/config.cfg hipnotic/config.cfg honey/config.cfg

# 3 - fichiers d'Abyss
cp rogue/config.cfg abyss
cp -r ../tmp/mod4/abyss/maps abyss
cp -r ../tmp/mod4/abyss/sound abyss
