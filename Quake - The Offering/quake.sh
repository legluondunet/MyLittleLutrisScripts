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
            ./darkplaces-sdl
            ;;
        "$scourge")
            ./darkplaces-sdl -hipnotic
	     ;;
        "$eternity")
            ./darkplaces-sdl -rogue
	     ;;	 
        "$abyss")
            ./darkplaces-sdl -rogue -game abyss
	     ;;	         
    esac
