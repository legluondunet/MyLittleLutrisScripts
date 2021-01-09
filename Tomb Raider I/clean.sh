#!/bin/bash

lang=$1
echo $lang

cd "drive_c/TOMBATI/"
sed -i -e "s/localization = false/localization = true/" -e "s/localization_locale =.*/localization_locale = $lang/" patches/tomb*
if [[ "$lang" =~ ^(en_gb|fr_fr|de_de|jp_jp)$ ]] 
then
wget "https://github.com/legluondunet/MyLittleLutrisScripts/raw/master/Tomb%20Raider%20I/tombati_multi_lang/tombati_audio_$lang.zip"
ls
7z e -y tombati_audio_$lang.zip -omusic/
fi

sed -i "s/textureSize2D/textureSize/" shaders/ati3dcif.fsh
rm -f -r tombati_audio_$lang.zip INSTALL.BAT shortcutJS.bat vc_redist.x86.exe

