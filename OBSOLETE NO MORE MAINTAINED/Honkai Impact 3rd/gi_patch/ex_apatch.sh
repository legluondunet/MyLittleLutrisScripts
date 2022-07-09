#!/bin/bash

current_path=$(pwd)
cd "$current_path"
cd "../Program Files/Genshin Impact/Genshin Impact game/"
bash ../../../gi_patch/patch.sh

echo "Press enter to close this window..."
read a
