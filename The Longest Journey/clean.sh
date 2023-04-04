#!/bin/bash

lang=$1

echo la variable lang est "$lang" et folder est "$folder"
if [ "$lang" = "keep" ]
then
echo "I prefer to keep default install language for menus and subtitles"
exit
elif [ "$lang" = "fr" ]
then
file="https://www.dropbox.com/s/5p95ijpbr3b1ox6/tlj_4cd-gog_menus_sub_fr.7z?dl=1"
elif [ "$lang" = "ge" ]
then
file="https://www.dropbox.com/s/oyeh1zzpgl5fwkm/tlj_4cd-gog_menus_sub_ge.7z?dl=1"
elif [ "$lang" = "it" ]
then
file="https://www.dropbox.com/s/jybo8ft18bhu5os/tlj_4cd-gog_menus_sub_it.7z?dl=1"
elif [ "$lang" = "sp" ]
then 
file="https://www.dropbox.com/s/vcx8l7vry3kdmm2/tlj_4cd-gog_menus_sub_sp.7z?dl=1"
fi

echo la variable file est "$file"
wget -O tlj_4cd-gog_menus_sub_multi5.7z "$file"
ls tlj_4cd-gog_menus_sub_multi5.7z
7z x tlj_4cd-gog_menus_sub_multi5.7z
cp -r "$lang/"* .

rm -f -r tlj_4cd-gog_menus_sub_multi5.7z $lang
