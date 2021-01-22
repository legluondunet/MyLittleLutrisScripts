#!/bin/bash

rwidth=$1
rheight=$2

echo la résoluton est $rwidth x $rheight

cd "drive_c/GOG Games"
mv app "Star Wars Jedi Knight - Dark Forces 2"
cd "Star Wars Jedi Knight - Dark Forces 2"
cp __support/add/winmm.dll .
rm -f -r ../tmp __support goggame-1422286819.* webcache.zip
sed -i 's/"resolution".*/"resolution": [ '$rwidth', '$rheight' ],/' jkgm.json
