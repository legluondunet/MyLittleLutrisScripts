#!/bin/sh

cd System


zenity_base() {
zenity "$@" --icon-name='lutris' --width="450" --height="250"  --title="Unreal Gold"
}

zenity_main_menu() { 
play_ugold="Play Unreal Gold"
play_pad="How to play Unreal Gold with a gamepad"

CHOICE=$(zenity_base --list --radiolist  \
        --column="" --column="" \
        "TRUE" "$play_ugold" \
        "FALSE" "$play_pad" )

echo "valeur de la variable CHOICE: " $CHOICE
    case "$CHOICE" in
        "$play_ugold")
            LD_LIBRARY_PATH=../libs ./UnrealLinux.bin -log
            ;;
        "$play_pad") 
        xdg-open ../"gamepad profiles/unreal_gamepad_readme.html"

zenity_main_menu
	     ;;      
    esac

}

zenity_main_menu
	
