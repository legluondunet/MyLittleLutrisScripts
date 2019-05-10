cd "c:\GOG Games\Indiana Jones and the Emperor's Tomb\sed4win"
start sed.exe -i -e "s/\(^res_width=\).*/\11280/" -e "s/\(^res_height=\).*/\1960/" -e "s/\(^res_bpp=\).*/\132/" -e "s/\(^fpsLimit=\).*/\160/" "c:\GOG Games\Indiana Jones and the Emperor's Tomb\GameData\indy\vars.cfg"
