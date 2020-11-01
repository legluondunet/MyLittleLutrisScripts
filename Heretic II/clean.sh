#!/bin/bash

# all game files and folders in lowercase
cd "drive_c/Program Files (x86)/Heretic II"
find .  -depth -type d -print0 | xargs -0n 1 bash -c 's=$(dirname "$0")/$(basename "$0"); d=$(dirname "$0")/$(basename "$0"|tr "[A-Z]" "[a-z]"); mv -f "$s" "$d"';
find .  -depth -type f -print0 | xargs -0n 1 bash -c 's=$(dirname "$0")/$(basename "$0"); d=$(dirname "$0")/$(basename "$0"|tr "[A-Z]" "[a-z]"); mv -f "$s" "$d"';

# apply patch 1.06c Linux only
cp -r ../../tmp/patch-1.06c .
# apply patch 1.07 Windows only
cp -r ../../tmp/patch107w .
# set of deathmatch maps for the full version of Heretic II (all platforms)
cp -r ../../tmp/dm-maps .


