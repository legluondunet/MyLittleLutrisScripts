#!/bin/bash

cd Epsilon


zenity_base() {
zenity "$@" --icon-name='lutris' --width="500" --height="400"  --title="Quake - The offering"
}

classic="Play Quake Classic version"
scourge="Play Quake - Mission Pack 1 - Scourge of Armagon"
eternity="Play Quake - Mission Pack 2 - Dissolution of Eternity"
abyss="Play Quake - Mission Pack 3 - Abyss of Pandemonium"

CHOICE=$(zenity_base --list --radiolist  \
        --column="" --column="" \
        "TRUE" "$classic" \
        "FALSE" "$scourge" \
        "FALSE" "$eternity" \
        "FALSE" "$abyss" )

echo "valeur de la variable CHOICE: " $CHOICE
    case "$CHOICE" in
        "$classic")
            LD_LIBRARY_PATH=libs ./darkplaces-linux-x86_64-glx
            ;;
        "$scourge")
            LD_LIBRARY_PATH=libs ./darkplaces-linux-x86_64-glx -hipnotic
	     ;;
        "$eternity")
            LD_LIBRARY_PATH=libs ./darkplaces-linux-x86_64-glx -rogue
	     ;;	 
        "$abyss")
            LD_LIBRARY_PATH=libs ./darkplaces-linux-x86_64-glx -rogue -game abyss
	     ;;	         
    esac
