#!/bin/bash
chmod -R +w *
find .  -depth -type d -print0 | xargs -0n 1 bash -c 's=$(dirname "$0")/$(basename "$0"); d=$(dirname "$0")/$(basename "$0"|tr "[A-Z]" "[a-z]"); mv -f "$s" "$d"';
find .  -depth -type f -print0 | xargs -0n 1 bash -c 's=$(dirname "$0")/$(basename "$0"); d=$(dirname "$0")/$(basename "$0"|tr "[A-Z]" "[a-z]"); mv -f "$s" "$d"';
cd cd1
mv music/2m29.wav music/2m29.wav.bak
mv smackslo smackslo.bak
mv speech/speech.clu speech/speech1.clu
cd ../cd2
mv smackslo smackslo.bak
mv speech/speech.clu speech/speech2.clu
cp -Rf * ../cd1
cd ..
mv cd1/* .
#rm -rf cd1 cd2

