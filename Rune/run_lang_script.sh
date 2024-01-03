#!/bin/bash

lang=$1
echo "la variable lang est égale à " $lang

if [ $lang == "int" ]; then 
exit
elif [ $lang == "frt" ]; then
wget --no-check-certificate -O "rune_lang_"$lang".tar.xz" "https://www.dropbox.com/scl/fi/1o5hntq41wpnk9p5ba8nc/rune_lang_fr.tar.xz?rlkey=r6gsteitd59rt72xx1bcmrpzw&dl=1"
elif [ $lang == "itt" ]; then
wget --no-check-certificate -O "rune_lang_"$lang".tar.xz" "https://www.dropbox.com/scl/fi/f1x1803jabdw6uhl2xtkj/rune_lang_it.tar.xz?rlkey=io89b3xh7ma03jr3n4ane0nkk&dl=1"
elif [ $lang == "det" ]; then
wget --no-check-certificate -O "rune_lang_"$lang".tar.xz" "https://www.dropbox.com/scl/fi/hjbigxybore2mdo30skka/rune_lang_de.tar.xz?rlkey=fhcbw6bnsr0mghkqmsoafyc39&dl=1"
elif [ $lang == "est" ]; then
wget --no-check-certificate -O "rune_lang_"$lang".tar.xz" "https://www.dropbox.com/scl/fi/vjlw1582svdyvx8ilz1ez/rune_lang_es.tar.xz?rlkey=n8cfaivslb2d8zy1v6ztsnd7j&dl=1"
elif [ $lang="rut" ]; then
wget --no-check-certificate -O "rune_lang_"$lang".tar.xz" "https://www.dropbox.com/scl/fi/y6tp6twbs4aechpn1uq6x/rune_lang_ru.tar.xz?rlkey=hct32jidbyn0m334796t3jdxr&dl=1"
fi
