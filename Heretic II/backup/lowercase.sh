#!/bin/bash

folder=$1

if cd "$folder"
then
find .  -depth -type d -print0 | xargs -0n 1 bash -c 's=$(dirname "$0")/$(basename "$0"); d=$(dirname "$0")/$(basename "$0"|tr "[A-Z]" "[a-z]"); mv -f "$s" "$d"';
find .  -depth -type f -print0 | xargs -0n 1 bash -c 's=$(dirname "$0")/$(basename "$0"); d=$(dirname "$0")/$(basename "$0"|tr "[A-Z]" "[a-z]"); mv -f "$s" "$d"';

