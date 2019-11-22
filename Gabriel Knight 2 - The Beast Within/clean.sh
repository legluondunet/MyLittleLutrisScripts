#!/bin/bash
chmod -R +w *
find CD*  -depth -type d -print0 | xargs -0n 1 bash -c 's=$(dirname "$0")/$(basename "$0"); d=$(dirname "$0")/$(basename "$0"|tr "[a-z]" "[A-Z]"); mv -f "$s" "$d"';
find CD*  -depth -type f -print0 | xargs -0n 1 bash -c 's=$(dirname "$0")/$(basename "$0"); d=$(dirname "$0")/$(basename "$0"|tr "[a-z]" "[A-Z]"); mv -f "$s" "$d"';

cd CD1
mv RESOURCE.AUD RESAUD.001
mv RESOURCE.SFX RESSFX.001
cd ../CD2
mv RESOURCE.AUD RESAUD.002
mv RESOURCE.SFX RESSFX.002
cd ../CD3
mv RESOURCE.AUD RESAUD.003
mv RESOURCE.SFX RESSFX.003
cd ../CD4
mv RESOURCE.AUD RESAUD.004
mv RESOURCE.SFX RESSFX.004
cd ../CD5
mv RESOURCE.AUD RESAUD.005
mv RESOURCE.SFX RESSFX.005
cd ../CD6
mv RESOURCE.AUD RESAUD.006
mv RESOURCE.SFX RESSFX.006
cd ..
cp -Rf CD2/* CD1/
cp -Rf CD3/* CD1/
cp -Rf CD4/* CD1/
cp -Rf CD5/* CD1/
cp -Rf CD6/* CD1/
rm -rf CD2 CD3 CD4 CD5 CD6
mv CD1 GK2
