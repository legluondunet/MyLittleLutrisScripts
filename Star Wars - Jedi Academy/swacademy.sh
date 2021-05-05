#!/usr/bin/env sh

zenity_base() {
zenity "$@" --icon-name='lutris' --width="400" --title="DevilutionX"
}

singleplayer="Play Star Wars Academy - SIngle player"
multiplayer="Play Star Wars Academy - Multiplayer"

CHOICE=$(zenity_base --list --radiolist --height="200" \
        --column="" --column="Command" \
        "TRUE" "$singleplayer" \
        "FALSE" "$multiplayer")

echo "valeur de la variable CHOICE: " $CHOICE
    case "$CHOICE" in
        "$singleplayer")
            ./openjk_sp.x86_64 +set fs_homepath . +set r_mode -2 +set r_noborder 1 +set r_centerWindow 1 +set s_kHz 44 +set cg_fovAspectAdjust 1 +set se_language French
            ;;
        "$multiplayer")
            ./openjk.x86_64 +set fs_homepath . +set r_mode -2 +set r_noborder 1 +set r_centerWindow 1 +set s_kHz 44 +set cg_fovAspectAdjust 1 +set se_language French
	     ;;
    esac

