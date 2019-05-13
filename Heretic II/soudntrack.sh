#!/bin/bash
if h2device=$(df|grep HERETIC_II |grep -Po "^........"); then
	echo "Le CD HERETIC II est monté sur" $h2device
		if cdp=$(which cdparanoia); then
		echo "cdparanoia est installé à cet emplacement:" $cdp
		$cdp -d $h2device -w -B 2-4
		else
		echo "cdparanoia n'est pas installé, utilisation du cdparanoia local"
		cdp2=($(pwd)/cdparanoia)
		$cdp2 -d $h2device -w -B 2-4
		ls *.wav
		for f in *.wav; do mv "$f" "$(echo "$f" | sed s/cdda.//)"; done
		ls *.wav
		for f in *.wav; do mv "$f" "$(echo "$f" | sed s/track//)"; done
		ls *.wav
		fi
		mv -f *.wav $(pwd)/wav
else
echo "Veuillez insérer le CD HERETIC II pour l'extraction des pistes audio"
fi
