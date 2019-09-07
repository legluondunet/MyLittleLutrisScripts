#!/bin/bash

#Pour changer la langue du jeu:
#copier les fichiers du répertoire music 22, puis 24  à 61.
#ajouter le fichier des textes (english.pak, francais.pak, italiano.pak, deutsch.pak)
#et enfin patcher le fichier INDARK3.CFG comme suit:
#lang=$1
#echo $lang

#echo installing $lang files...

#for i in {0,1,2,3,4} 
#do
#	sed -i -e 's/\x30\x0'$i'\xff\x03/\x30\x0'$lang'\xff\x03/g' "INDARK3/INDARK3.CFG"
#done

mv __support/app dosbox_conf
rm -f -r app commonappdata/ DOSBOX/ __redist/ __support/ tmp/ gog*

cd dosbox_conf

sed -i 's=..\\=../=g' dosboxAlone3_single.conf
sed -i 's=GAME.\INS=game.\ins=g' dosboxAlone3_single.conf

sed -i 's/fullscreen=true/fullscreen=false/g' dosboxAlone3.conf
sed -i 's/fulldouble=false/fulldouble=true/g' dosboxAlone3.conf
sed -i 's/output=overlay/output=opengl/g' dosboxAlone3.conf

