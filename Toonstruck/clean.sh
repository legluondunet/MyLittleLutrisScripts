#!/bin/bash
chmod -R +w *
find .  -type d -print0 | xargs -0n 1 bash -c 's=$(dirname "$0")/$(basename "$0"); d=$(dirname "$0")/$(basename "$0"|tr "[a-z]" "[A-Z]"); mv -f "$s" "$d"';
find .  -type f -print0 | xargs -0n 1 bash -c 's=$(dirname "$0")/$(basename "$0"); d=$(dirname "$0")/$(basename "$0"|tr "[a-z]" "[A-Z]"); mv -f "$s" "$d"';
cp -Rf TOONSTRUCKCD2/* TOONSTRUCKCD1/
rm -rf TOONSTRUCKCD2
mv TOONSTRUCKCD1 TOONSTRUCKCD
cd TOONSTRUCKCD
rm -f -r BURST/ AUTOPLAY.EXE AUTORUN.INF DOS4GW.EXE INSTALL.BAT README.PIF README.EXE SETUP.EXE  SETUP.INI  SETUP.PIF
