#!/bin/bash

cd Epsilon


zenity_base() {
zenity "$@" --icon-name='lutris' --width="450" --height="250"  --title="Quake - The offering"
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
            ./darkplaces-linux-x86_64-sdl
            ;;
        "$scourge")
            ./darkplaces-linux-x86_64-sdl -hipnotic
	     ;;
        "$eternity")
            ./darkplaces-linux-x86_64-sdl -rogue
	     ;;	 
        "$abyss")
            ./darkplaces-linux-x86_64-sdl -rogue -game abyss
	     ;;	         
    esac
