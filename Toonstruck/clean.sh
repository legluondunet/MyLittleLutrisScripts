#!/bin/bash
chmod -R +w *
find .  -type d -print0 | xargs -0n 1 bash -c 's=$(dirname "$0")/$(basename "$0"); d=$(dirname "$0")/$(basename "$0"|tr "[a-z]" "[A-Z]"); mv -f "$s" "$d"';
find .  -type f -print0 | xargs -0n 1 bash -c 's=$(dirname "$0")/$(basename "$0"); d=$(dirname "$0")/$(basename "$0"|tr "[a-z]" "[A-Z]"); mv -f "$s" "$d"';
cp -Rf TOONSTRUCKCD2/* TOONSTRUCKCD1
mv TOONSTRUCKCD1 TOONSTRUCKCD
rm -rf TOONSTRUCKCD2
cd TOONSTRUCKCD
#rm -f -r burst/ auto* dos4gw.exe install.bat readme.pif setup.* readme.exe
