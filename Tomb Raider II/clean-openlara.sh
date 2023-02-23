#!/bin/bash

cd level/2
mv TITLE.tr2 TITLE.TR2
for file in *.PCX
do
echo mv "$file" "${file/PCX/png}"
mv "$file" "${file/PCX/PNG}"
done
cp TITLE.PNG TITLEUS.PNG
cp MAIN.SFX ../../audio/2

cd ../../audio/2
echo $LD_LIBRARY_PATH
export LD_LIBRARY_PATH=""
for file in *.mp3
do
filename="${file%.*}"
n=${#filename}
echo traitement du fichier $file
echo $filename est composé de $n caractères
if [ "$n" == "1" ]
then 
filename="0$filename"
echo le nom de fichier $filename comporte à présent 2 caractères
fi
echo $file
echo exécution de la commande "ffmpeg -i $file track_$filename.ogg"
ffmpeg -i $file track_$filename.ogg
done
