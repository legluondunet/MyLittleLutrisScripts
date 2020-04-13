#!/bin/bash

rmp=$1

cd drive_c/id1
mv PAK0.PAK PAK0.PAK.DEMO

cp $tmp/app/td1/id1/PAK0.PAK drive_c/id1/
cp $tmp/app/td1/id1/PAK1.PAK drive_c/id1/

- merge:
    dst: $GAMEDIR/id1/
    src: $CACHE/app/id1/PAK1.PAK
- execute:
    command: cd "$GAMEDIR"; rm -f -r *.exe *.dll

./bchunk game.gog game.cue test2 -w

7z x test01.iso
