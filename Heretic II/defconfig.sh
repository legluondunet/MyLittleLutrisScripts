#!/bin/bash

cd HERETICIICDL/base
if [ -f "default.cfg.ori" ]; then
    echo "default.cfg.ori existe"
else
echo "ne peut trouver le fichier default.cfg.ori"
cp default.cfg default.cfg.ori
fi
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
sed -i 's/bind ` "toggleconsole"/bind Tab "toggleconsole"/' default.cfg
sed -i 's/bind Tab "+lookaround"/bind "+lookaround"/' default.cfg


sed -i '$ a set con_alpha "0.5"' default.cfg
sed -i '$ a set win_noalttab "0"' default.cfg
sed -i '$ a set r_detail "3"' default.cfg
sed -i '$ a set blood_level "3"' default.cfg
sed -i '$ a set in_joystick "none"' default.cfg
sed -i '$ a set autoweapon "0"' default.cfg

