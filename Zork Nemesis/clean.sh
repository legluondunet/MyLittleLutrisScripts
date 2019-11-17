#!/bin/bash
chmod -R +w *
find .  -depth -type d -print0 | xargs -0n 1 bash -c 's=$(dirname "$0")/$(basename "$0"); d=$(dirname "$0")/$(basename "$0"|tr "[a-z]" "[A-Z]"); mv -f "$s" "$d"';
find .  -depth -type f -print0 | xargs -0n 1 bash -c 's=$(dirname "$0")/$(basename "$0"); d=$(dirname "$0")/$(basename "$0"|tr "[a-z]" "[A-Z]"); mv -f "$s" "$d"';
mv ZNCD1/NEMESIS/* .
cp -Rf ZNCD2/ZASSETS/* ZNCD1/ZASSETS/*
cp -Rf ZNCD3/ZASSETS/* ZNCD1/ZASSETS/*
mv ZNCD1/ZASSETS/ .
rm -f -r ZNCD1 ZNCD2 ZNCD3 QMIXER95.DLL ZNEMESIS.EXE ZNEMESIS.INI
