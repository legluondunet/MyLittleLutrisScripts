#!/bin/bash
cd "drive_c/GOG Games/Indiana Jones and the Emperor's Tomb/GameData/indy/"
sed -i -e 's/\(^res_width=\).*/\11280/' -e 's/\(^res_height=\).*/\1960/' -e 's/\(^res_bpp=\).*/\132/' -e 's/\(^fpsLimit=\).*/\160/' "vars.cfg"
