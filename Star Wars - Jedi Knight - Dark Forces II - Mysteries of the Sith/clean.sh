#!/bin/bash

rwidth=$1
rheight=$2

echo la résoluton est $rwidth x $rheight

cd "drive_c/GOG Games"
mv app "Star Wars Jedi Knight - Dark Forces 2 - Mysteries of the Sith"
cd "Star Wars Jedi Knight - Dark Forces 2 - Mysteries of the Sith"
cp __support/add/winmm_w10.dll winmm.dll
rm -f -r ../tmp __support goggame-1422285784.* webcache.zip
sed -i 's/"resolution".*/"resolution": [ '$rwidth', '$rheight' ],/' jkgm.json
