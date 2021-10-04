#!/bin/sh

cd System


zenity_base() {
zenity "$@" --icon-name='lutris' --width="450" --height="250"  --title="Unreal Tournament 2004"
}

zenity_main_menu() { 
play_ut2004="Play Unreal Tournament 2004"
changecdkey="Enter your personnal GOG CDKey"

CHOICE=$(zenity_base --list --radiolist  \
        --column="" --column="" \
        "TRUE" "$play_ut2004" \
        "FALSE" "$changecdkey" )

echo "valeur de la variable CHOICE: " $CHOICE
    case "$CHOICE" in
        "$play_ut2004")
            LD_LIBRARY_PATH=libs ./ut2004-bin-linux-amd64
            ;;
        "$changecdkey") 
        
if zenity_base --question --text="	
GOG provides UT2004 with a generic CDKey 
3QHVC-DHA9K-A84RE-KYRT4
that does not permit you to play in multiplayer mode,
you could be banned on most UT2004 servers.
To play UT2004 in multiplayer mode, you will need to ask for your
personal UT2004 CDKey to GOG support here:

http://www.gog.com/support/contact/technical_issues_with_games/unreal_tournament_2004_ece

Choose the multiplayer key request option for problem type.

Do you want to enter your UT2004 personnal CDKey
provided by GOG support now?" --width=500

then
    	if inputStr=$(zenity_base --entry --title "Unreal Tournament 2004" --text "Please enter your UT2004 personnal CDKey provided by GOG support:")
	then
	      if [ "$inputStr" = "" ]
	      then
	      zenity_base --info --text "CDKey can not be empty" 
	      echo variables input=$inputStr ?=$?
	      elif [ ! -z $inputStr ]
	      then
	      zenity_base --info --text "UT2004 CDKey has been corrrectly changed to 
		
		"$inputStr"."
	      echo variables input=$inputStr ?=$?
fi
   	fi
   		fi
zenity_main_menu
	     ;;      
    esac

}

zenity_main_menu
	
