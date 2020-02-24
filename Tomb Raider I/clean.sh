#!/bin/bash

lang=$1

cd "drive_c/TOMBATI/patches"
sed -i -e "s/localization = false/localization = true/" -e "s/localization_locale =.*/localization_locale = $lang/" tomb*
if [[ "$lang" =~ ^(en_gb|fr_fr|de_de|jp_jp)$ ]] 
then cd ..
echo $lang
pwd
wget "https://github.com/legluondunet/MyLittleLutrisScripts/raw/master/Tomb%20Raider%20I/tombati_multi_lang/tombati_audio_$lang.zip"
ls
7z e -y tombati_audio_$lang.zip -omusic/
fi

