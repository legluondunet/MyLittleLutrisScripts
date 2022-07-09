#!/bin/sh

zenity_base() {
zenity "$@" --icon-name='lutris' --width="450" --height="250"  --title="Genshin Impact Wine Patch"
}

zenity_main_menu() { 
gi_patch="Patch Genshin Impact"
gi_unpatch="Unpatch Genshin Impact"

CHOICE=$(zenity_base --list --radiolist  \
        --column="" --column="" \
        "TRUE" "$gi_patch" \
        "FALSE" "$gi_unpatch" )

echo "valeur de la variable CHOICE: " $CHOICE
    case "$CHOICE" in
        "$gi_patch")
            cd drive_c/gi_patch
            xterm ./ex_apatch.sh
            ;;
        "$gi_unpatch") 
        cd drive_c/gi_patch
        xterm ./ex_rpatch.sh
	     ;;      
    esac
}

zenity_main_menu
