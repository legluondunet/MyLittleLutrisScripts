#!/bin/bash

rwidth=$1
rheight=$2

# debug
echo la résolution native du bureau est $width $rheight
ls -l

# la résolution est-elle supportée par le jeu?
if [ $rwidth = "1920" ] && [ $rheight = "1080" ];
then
echo la résolution est supportée

# intro cut scenes
wget -P drive_c/tmp/ https://github.com/legluondunet/MyLittleLutrisScripts/raw/4e9b84d25fada36e04ca61fda79e1da7ca6388d3/Star%20Wars%20-%20Knights%20of%20the%20Old%20Republic/kotor_intro_cutscenes_"$rwidth"x"$rheight".7z
7z x -aoa drive_c/tmp/kotor_intro_cutscenes_"$rwidth"x"$rheight".7z -odrive_c/tmp
cp 'drive_c/tmp/movies_HD/'"$rwidth"'x'"$rheight"'/'* "drive_c/GOG Games/Star Wars - KotOR/movies"

# mods folder
mkdir -p "drive_c/GOG Games/Star Wars - KotOR/override"
cp "drive_c/tmp/gui."$rwidth"x"$rheight"/"* "drive_c/GOG Games/Star Wars - KotOR/override"
cp "drive_c/tmp/hd_ui_menupack_PV/"* "drive_c/GOG Games/Star Wars - KotOR/override"
cp "drive_c/tmp/[K1]_Main_Menu_Widescreen_Fix_v1.2/"* "drive_c/GOG Games/Star Wars - KotOR/override"
cp "drive_c/tmp/Kotor_1_Logo_Fix_and_Bigger_HUD/"* "drive_c/GOG Games/Star Wars - KotOR/override"
cp "drive_c/tmp/KoToR1IconMOD/"* "drive_c/GOG Games/Star Wars - KotOR/override"
cp "drive_c/tmp/hd_pc_portraits/"* "drive_c/GOG Games/Star Wars - KotOR/override"
cd "drive_c/GOG Games/Star Wars - KotOR/"

# widescreen patch
cp swkotor.exe swkotor.exe.ori
patch < ../../tmp/swkotor_gog_ws_"$rwidth"x"$rheight".patch swkotor.exe
fi
