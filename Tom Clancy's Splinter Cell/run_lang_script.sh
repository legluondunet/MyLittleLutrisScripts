#!/bin/bash


lang=$1
echo "la variable lang est égale à " $lang
cache_path=$2
echo "la variable cache_path est égale à " $cache_path
cd "$cache_path"

if [ $lang == "int" ]; then
exit
elif [ $lang == "fra" ]; then
wget --no-check-certificate -O sc1_multi5_fra.zip https://www.dropbox.com/scl/fi/2298jdgfv6bxg9ubbyw9t/sc1_multi5_fra.zip?rlkey=5js1llzofg34dw9y4k5oaka8k&dl=1
elif [ $lang == "ita" ]; then
wget --no-check-certificate -O sc1_multi5_ita.zip https://www.dropbox.com/scl/fi/q8o5f02v3qjcet129zq2q/sc1_multi5_ita.zip?rlkey=889czkpcwpmebhuvcmddpunf5&dl=1
elif [ $lang == "deu" ]; then
wget --no-check-certificate -O sc1_multi5_deu.zip https://www.dropbox.com/scl/fi/a6lwshfyro4my8tq5t7a6/sc1_multi5_deu.zip?rlkey=ck2gxl290qto60znp21e07nyv&dl=1
elif [ $lang == "esp" ]; then
wget --no-check-certificate -O sc1_multi5_esp.zip https://www.dropbox.com/scl/fi/jc2312t41r6vvg72u4ak4/sc1_multi5_esp.zip?rlkey=lsit4ludbyq46x36awenbtwsd&dl=1
fi
