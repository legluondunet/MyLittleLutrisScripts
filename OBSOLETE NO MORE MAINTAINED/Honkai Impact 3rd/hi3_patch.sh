#!/bin/sh

zenity_base() {
zenity "$@" --icon-name='lutris' --width="450" --height="250"  --title="Honkai Impact 3rd Wine Patch"
}

zenity_main_menu() { 
gi_patch="Patch Honkai Impact 3rd"
gi_unpatch="Unpatch Honkai Impact 3rd"

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
