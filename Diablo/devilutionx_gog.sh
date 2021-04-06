#!/usr/bin/env sh

zenity_base() {
zenity "$@" --icon-name='lutris' --width="400" --title="DevilutionX"
}

classic="Play Diablo Classic version"
hellfire="Play Diablo Hellfire version"

CHOICE=$(zenity_base --list --radiolist --height="200" \
        --column="" --column="Command" \
        "TRUE" "$classic" \
        "FALSE" "$hellfire")

echo "valeur de la variable CHOICE: " $CHOICE
    case "$CHOICE" in
        "$classic")
            ./devilutionx-linux-x86_64.appimage --data-dir classic --save-dir classic --config-dir classic
            ;;
        "$hellfire")
            ./devilutionx-linux-x86_64.appimage --data-dir hellfire --save-dir hellfire --config-dir hellfire
	     ;;
    esac

