#!/bin/bash
ls -l

rwidth=$1
rheight=$2

mkdir -p "drive_c/GOG Games/Star Wars - KotOR/override"
cp "drive_c/tmp/gui."$rwidth"x"$rheight"/"* "drive_c/GOG Games/Star Wars - KotOR/override"
cp "drive_c/tmp/hd_ui_menupack_PV/"* "drive_c/GOG Games/Star Wars - KotOR/override"
cp "drive_c/tmp/[K1]_Main_Menu_Widescreen_Fix_v1.2/"* "drive_c/GOG Games/Star Wars - KotOR/override"
cp "drive_c/tmp/Kotor_1_Logo_Fix_and_Bigger_HUD/"* "drive_c/GOG Games/Star Wars - KotOR/override"
cp "drive_c/tmp/KoToR1IconMOD/"* "drive_c/GOG Games/Star Wars - KotOR/override"
cd "drive_c/GOG Games/Star Wars - KotOR/"
cp swkotor.exe swkotor.exe.ori
patch < ../../tmp/swkotor_gog_ws_"$rwidth"x"$rheight".patch swkotor.exe


