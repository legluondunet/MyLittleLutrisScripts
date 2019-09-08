#!/bin/bash

if [ -d "drive_c/GOG Games/app/Tomb Raider 1" ]; then
mv  "drive_c/GOG Games/app/Tomb Raider 1" "drive_c/GOG Games/Tomb Raider 1"
elif  [ -d "drive_c/GOG Games/app/TOMBRAID" ]; then
mv  "drive_c/GOG Games/app/" "drive_c/GOG Games/Tomb Raider 1"
fi
