#!/bin/bash

rwidth=$1
rheight=$2

# debug 
echo la résolution native du bureau est $rwidth $rheight
ls -l

# si la résolution est supportée
if [ $rwidth = "1920" ] && [ $rheight = "1080" ];
then
echo la résolution est supportée

#downloads mods
mkdir drive_c/tmp
cd drive_c/tmp
wget https://github.com/legluondunet/MyLittleLutrisScripts/raw/master/Star%20Wars%20-%20Knights%20of%20the%20Old%20Republic/mods/k1hrm-1.4.7z
wget https://github.com/legluondunet/MyLittleLutrisScripts/raw/master/Star%20Wars%20-%20Knights%20of%20the%20Old%20Republic/mods/%5BK1%5D_Main_Menu_Widescreen_Fix_v1.2.7z
wget https://github.com/legluondunet/MyLittleLutrisScripts/raw/master/Star%20Wars%20-%20Knights%20of%20the%20Old%20Republic/mods/HD%20MENU%20AND%20UI%20Art%20v%201.0.7z.001
wget https://github.com/legluondunet/MyLittleLutrisScripts/raw/master/Star%20Wars%20-%20Knights%20of%20the%20Old%20Republic/mods/HD%20MENU%20AND%20UI%20Art%20v%201.0.7z.002
wget https://github.com/legluondunet/MyLittleLutrisScripts/raw/master/Star%20Wars%20-%20Knights%20of%20the%20Old%20Republic/mods/hd_pc_portraits-v1.0.7z
wget https://github.com/legluondunet/MyLittleLutrisScripts/raw/master/Star%20Wars%20-%20Knights%20of%20the%20Old%20Republic/mods/hd_npc_portraits-v2.0.7z
wget https://github.com/legluondunet/MyLittleLutrisScripts/raw/master/Star%20Wars%20-%20Knights%20of%20the%20Old%20Republic/mods/KoToR1IconMOD.7z
wget https://github.com/legluondunet/MyLittleLutrisScripts/raw/master/Star%20Wars%20-%20Knights%20of%20the%20Old%20Republic/mods/kotor_intro_cutscenes_"$rwidth"x"$rheight".7z

# extract all 7z archives
7z x -aoa .
mkdir -p "../GOG Games/Star Wars - KotOR/override"

# install mods
cp "16-by-9/gui.1920x1080/"* "../GOG Games/Star Wars - KotOR/override"
cp "[K1]_Main_Menu_Widescreen_Fix_v1.2/For Override/"* "../GOG Games/Star Wars - KotOR/override"
cp "HD MENU AND UI Art v 1.0/"* "../GOG Games/Star Wars - KotOR/override"
cp "hd_pc_portraits/Override/"* "../GOG Games/Star Wars - KotOR/override"
cp "hd_npc_portraits/Override/"* "../GOG Games/Star Wars - KotOR/override"
cp "KoToR1IconMOD/Override/"* "../GOG Games/Star Wars - KotOR/override"
cp 'movies_HD/'"$rwidth"'x'"$rheight"'/'* "../GOG Games/Star Wars - KotOR/movies"

# widescreen patch
cd "../GOG Games/Star Wars - KotOR/"
wget https://github.com/legluondunet/MyLittleLutrisScripts/raw/master/Star%20Wars%20-%20Knights%20of%20the%20Old%20Republic/resolution_patchs/swkotor_gog_ws_"$rwidth"x"$rheight".patch
cp swkotor.exe swkotor.exe.ori
patch < swkotor_gog_ws_"$rwidth"x"$rheight".patch swkotor.exe
fi

# clean
rm -f -r app commonappdata __redist __support tmp goggame-1207666283.* swkotor_gog_ws_"$rwidth"x"$rheight".patch ../../tmp;

