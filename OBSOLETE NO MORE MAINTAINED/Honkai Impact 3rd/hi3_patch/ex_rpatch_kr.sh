#!/bin/bash

current_path=$(pwd)
cd "$current_path"
cd "../Program Files/Honkai Impact 3rd kr/Games/"
bash ../../../gi_patch/patch_revert.sh

echo "Press enter to close this window..."
read a
Footer
