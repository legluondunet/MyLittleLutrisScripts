#!/bin/bash

cdname=$1

drive=$(mount |grep /$cdname |cut -d " " -f 1)

echo $drive $cdname

if ! [ -x "$(command -v cdrdao)" ]; then
  echo 'Error: cdrdao is not installed.'
exit
elif 
 ! [ -x "$(command -v toc2cue)" ]; then
  echo 'Error: toc2cue is not installed.'
exit
fi

rm -f -r $cdname*

cdrdao read-cd --datafile $cdname.bin --driver generic-mmc:0x00020000 --device $drive $cdname.toc
toc2cue $cdname.toc $cdname.cue
