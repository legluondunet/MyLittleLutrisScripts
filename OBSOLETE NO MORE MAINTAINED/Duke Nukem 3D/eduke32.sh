#!/bin/bash

here=$(pwd)
echo le répertoire courant est $here

grpfile=$(find * |grep -i duke3d.grp)

somme=$(cksum $grpfile | cut -d\  -f1 | xargs echo printf '%0X\\n' | sh)
 
echo la somme du fichier duke3d.grp est égale à $somme

if [ $somme = "D0C71EA3" ] ; then
echo le fichier duke3d.grp est celui de la version shareware 1.3d
elif [ $somme = "DBAC7B3B" ] ; then
echo le fichier duke3d.grp est celui de la version GOG "Duke Nukem 3D: Atomic Edition" ou la version Steam "Duke Nukem 3D: Megaton Edition"
elif [ $somme = "13F82A91" ] ; then
echo le fichier duke3d.grp est celui de la version Steam "Duke Nukem 3D: 20th Anniversary World Tour"
else
echo la version du fichier duke3d.grp n''est pas connue
fi

if [ ! "dn3d/addons/frightnight/addons/addons.grpinfo.bak" ]; then
echo "le fichier addons.grpinfo.bak n'existe pas"
cd "dn3d/addons/frightnight/addons"
cp addons.grpinfo addons.grpinfo.bak
cd "$here"
fi

if [ $somme = "13F82A91" ] && [ -d "dn3d/addons/frightnight/addons" ]; then
echo présence du fichier duke3d.grp "20th Anniversary World Tour", nécessite une manip
cd "dn3d/addons/frightnight/addons"
rm -f -r addons.grpinfo
cp addons_wt.bak addons_wt.grpinfo
cd "$here"
elif [ $somme != "13F82A91" ] && [ -d "dn3d/addons/frightnight/addons" ]; then
echo "le fichier duke3d.grp n'est pas celui du 20th"
cd "dn3d/addons/frightnight/addons"
rm -f -r addons_wt.grpinfo
cp addons.grpinfo.bak addons.grpinfo
cd "$here"
fi

LD_LIBRARY_PATH=libs ./eduke32 -usecwd -cfg config.cfg -j "dn3d/gog/" -j "dn3d/steam/" -j "dn3d/steam/classic/" -j "dn3d/steam/addons/dc/" -j "dn3d/steam/addons/nw/" -j "dn3d/steam/addons/vacation/" -j "dn3d/all/" -j "dn3d/addons/dc" -j "dn3d/addons/nw" -j "dn3d/addons/vacation" -j "dn3d/addons/frightnight/addons" -j "dn3d/addons/frightnight/dukezone2"  -grp "hrp/"*
