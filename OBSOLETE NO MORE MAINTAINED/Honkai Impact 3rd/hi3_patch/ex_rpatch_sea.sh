
#!/bin/bash

current_path=$(pwd)
cd "$current_path"
cd "../Program Files/Honkai Impact 3 sea/Games/"
bash ../../../hi3_patch/patch_revert.sh

echo "Press enter to close this window..."
read a
