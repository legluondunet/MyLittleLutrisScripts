#!/bin/sh

cd SC1
unzip *
mv data/* .
rm -f -r *.bin scripts guis data
cd ..
cd SC2
unzip *
mv data/* .
rm -f -r *.bin scripts guis data
cd ..

