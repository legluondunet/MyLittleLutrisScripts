#!/bin/bash

mydocspath=$(grep -m1 "Personal" user.reg)
echo $mydocspath

mydocsname=$(echo "${mydocspath}" | cut -d '\' -f7 | tr -d '"')
echo $mydocsname

profile_path="drive_c/users/$USER/$mydocsname/My Games/FINAL FANTASY XIV - A Realm Reborn"
echo $profile_path

mkdir -p "$profile_path"

cat <<EOF >"$profile_path/FFXIV_BOOT.cfg"

<FINAL FANTASY XIV Config File>

<Version>
Browser	1
StartupCompleted	1
EOF

cat <<EOF >"$profile_path/FFXIV.cfg"

<FINAL FANTASY XIV Config File>

<Cutscene Settings>
CutsceneMovieOpening 1
EOF

