#!/bin/bash

current_path=$(pwd)
cd "$current_path"
cd "../Program Files//Honkai Impact 3rd glb/Games/"
bash ../../../hi3_patch/patch.sh

echo "Press enter to close this window..."
read a
