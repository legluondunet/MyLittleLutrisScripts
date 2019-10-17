#!/bin/bash

cdpath=$1

setupfile=$(grep -E '^open=[A-Za-z]+\.exe' $cdpath/autorun.inf | grep -Eo '[A-Za-z]+\.exe')
echo "Determined name of executable to be $setupfile"

winpath=$(sed -e 's#/#\\#g' <<< "$cdpath/$setupfile")
echo "Z:$winpath" > installaoe.bat
