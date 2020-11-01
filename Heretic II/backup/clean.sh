#!/bin/bash

lang=$1

rwidth=$2

rheight=$3

lowerc()
{ find .  -depth -type d -print0 | xargs -0n 1 bash -c 's=$(dirname "$0")/$(basename "$0"); d=$(dirname "$0")/$(basename "$0"|tr "[A-Z]" "[a-z]"); mv -f "$s" "$d"';
find .  -depth -type f -print0 | xargs -0n 1 bash -c 's=$(dirname "$0")/$(basename "$0"); d=$(dirname "$0")/$(basename "$0"|tr "[A-Z]" "[a-z]"); mv -f "$s" "$d"';
}

res()
{
# 80 02 00 00 E0 01 = resolution 640 x 480
# 640 dec = 02 80 hex = 80 02 reversed order byte
# 480 dec = 01 E0 hex = E0 01 reversed order byte
# to replace 640 x 480 resolution by 1920x1080:
# 1920 dec = 0780 hex = reverse it and get 8007
# 1080 dec = 0438 hex = reverse it and get 3804
# insert between them separator "0000"
# and we finally get
# 80 07 00 00 38 04 for video mode 3 (640x480)

wb=$(echo 'obase=16;' $rwidth | bc)
hb=$(echo 'obase=16;' $rheight | bc)

echo $rwidthen hexa: $wb soit ${#wb} caractères
echo $rheighten hexa: $hb soit ${#hb} caractères

if [ ${#wb} = "1" ]; then wb="000$wb"
elif [ ${#wb} = "2" ]; then wb="00$wb"
elif [ ${#wb} = "3" ]; then wb="0$wb"
fi

echo wb est à présent égal à $wb

if [ ${#hb} = "1" ]; then hb="000$hb"
elif [ ${#hb} = "2" ]; then hb="00$hb"
elif [ ${#hb} = "3" ]; then hb="0$hb"
fi

echo hb est à présent égal à $hb

wb1=$(echo $wb |cut -c1-2)
wb2=$(echo $wb |cut -c3-4)
hb1=$(echo $hb |cut -c1-2)
hb2=$(echo $hb |cut -c3-4)

echo "Maintenant il faut remplacer 80 02 00 00 E0 01 (video mode 3 resolution 640 x 480) par $wb2 $wb1 00 00 $hb2 $hb1 (video mode 3 aura à présent une resolution de $rwidthx $h)"


if [ -f "heretic2" ]; then 
cp heretic2 heretic2.ori
echo sed -i -e 's/\x80\x02\x00\x00\xE0\x01/\x'$wb2'\x'$wb1'\x00\x00\x'$hb2'\x'$hb1'/g' heretic2
sed -i -e 's/\x80\x02\x00\x00\xE0\x01/\x'$wb2'\x'$wb1'\x00\x00\x'$hb2'\x'$hb1'/g' heretic2
fi

if [ -f "quake2.dll" ]; then
cp quake2.dll quake2.dll.ori
echo sed -i -e 's/\x80\x02\x00\x00\xE0\x01/\x'$wb2'\x'$wb1'\x00\x00\x'$hb2'\x'$hb1'/g' quake2.dll
sed -i -e 's/\x80\x02\x00\x00\xE0\x01/\x'$wb2'\x'$wb1'\x00\x00\x'$hb2'\x'$hb1'/g' quake2.dll
fi
}

# Heretic II Linux
if [ -f "HERETICIICDL" ]
cd "HERETICIICDL"
# all game files and folders in lowercase
lowerc
# apply patch 1.06c Linux only
cp -r ../tmp/* .
# patch resolution
res
# modify config file for Linux
cd base
cp default.cfg default.cfg.ori
sed -i 's/set gl_shadows.*/set gl_shadows "1"/' default.cfg
sed -i 's/set gl_ext_gamma.*/set gl_ext_gamma "1"/' default.cfg
sed -i 's/set gl_ext_gamma.*/set gl_ext_gamma "1"/' default.cfg
sed -i 's/set vid_gamma.*/set vid_gamma "1"/' default.cfg
sed -i 's/set vid_contrast.*/set vid_contrast "1"/' default.cfg
sed -i 's/set gl_ext_palettedtexture.*/set gl_ext_palettedtexture "1"/' default.cfg
sed -i 's/set fov.*/set fov "90"/' default.cfg
sed -i 's/set sc_framerate.*/set sc_framerate "60.0"/' default.cfg
sed -i 's/set s_khz.*/set s_khz "44"/' default.cfg
sed -i 's/set s_loadas8bit.*/set s_loadas8bit "0"/' default.cfg
sed -i 's/set crosshair.*/set crosshair "1"/' default.cfg
sed -i 's/set gl_modulate.*/set gl_modulate "3"/' default.cfg
sed -i 's/set gl_particle_att_c.*/set gl_particle_att_c "0.01"/' default.cfg
sed -i 's/set gl_particle_att_b.*/set gl_particle_att_b "0.01"/' default.cfg
sed -i 's/set fov.*/set fov "90"/' default.cfg
sed -i 's/set s_volume.*/s_volume "0.5"/' default.cfg
sed -i 's/set gl_sortmulti.*/set gl_sortmulti "1"/' default.cfg
sed -i 's/set autoweapon.*/set autoweapon "0"/' default.cfg
sed -i 's/set cl_run.*/set cl_run "1"/' default.cfg
sed -i 's/set cl_doautoaim.*/set cl_doautoaim "0"/' default.cfg
sed -i '$ a set con_alpha "0.5"' default.cfg
sed -i '$ a set win_noalttab "0"' default.cfg
sed -i '$ a set r_detail "3"' default.cfg
sed -i '$ a set blood_level "2"' default.cfg
sed -i '$ a set in_joystick "none"' default.cfg
sed -i '$ a set autoweapon "0"' default.cfg
sed -i '$ a bind F11 "screenshot"' default.cfg

#Windows
elif [ -f "drive_c/Program Files (x86)/Heretic II" ]
cd "drive_c/Program Files (x86)/Heretic II"
# all game files and folders in lowercase
lowerc
# apply patch 1.07 Windows only
cp -r ../../tmp/* .
# patch resolution
res
# modify config file for Windows
cd base
cp default.cfg default.cfg.ori
sed -i 's/set blood_level.*/set blood_level "2"/' default.cfg
sed -i 's/bind F5.*/bind F5 "menu_loadgame"/' default.cfg
sed -i 's/bind F6.*/bind F6 "save quick"/' default.cfg
sed -i 's/bind F4.*/bind F4 "menu_savegame"/' default.cfg
sed -i '$ a bind F7 "load quick"' default.cfg
sed -i '$ a set r_detail "3"' default.cfg
fi


