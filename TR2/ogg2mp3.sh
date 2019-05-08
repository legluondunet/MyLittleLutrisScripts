#!/bin/bash
cd /music/; 
for i in *.ogg;
do ffmpeg -i "$i" "${i%.*}.mp3"; 
done; 
for file in Track*.mp3; do mv -v "$file" "${file/Track/}"; 
done; 
rm -f -r *.ogg
