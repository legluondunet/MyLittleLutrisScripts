#!/bin/bash

sed -i -e 's/C.*/C \./'  -e 's/D.*/D "UAKM.GOG" -t iso/' dosboxTex3_single.conf
sed -i -e 's/fullscreen=.*/fullscreen=false/'  -e 's/fullresolution=.*/fullresolution=desktop/' -e 's/output=.*/output=opengl/' dosboxTex3.conf
rm -f -r  DOSBOX __support goggame-1207658767.* ;
