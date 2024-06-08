#!/bin/bash

lang1=$1

cd drive_c
mkdir "GOG Games"
mv "Sleeping Dogs Definitive Edition" "GOG Games"; 
cd "GOG Games/Sleeping Dogs Definitive Edition"
cp -r app/* .

rm -f -r app Callstacks commonappdata __redist tmp webcache.zip

if [ $lang1 = "English" ]; then
exit
elif [ $lang1 = "French" ]; then
lang2="fr-FR"
elif [ $lang1 = "Italian" ]; then
lang2="it-IT"
elif [ $lang1 = "German" ]; then
lang2="ge-GE"
elif [ $lang1 = "Spanish" ]; then
lang2="es-ES"
elif [ $lang1 = "Polish" ]; then
lang2="pl-PL"
elif [ $lang1 = "Russian" ]; then
lang2="ru-RU"
fi


echo $lang1 $lang2
sed -i -e "s/English/"$lang1"/" -e "s/en-US/"$lang2"/" goggame-1741843789.info




