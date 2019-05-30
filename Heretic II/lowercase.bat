@echo off
color 0d
title "installing Heretic II 1.07 patch..."
c:
cd c:\tmp\patch
c:\tmp\bin\zip -r -0 "Heretic II.zip" .
cd c:\Program Files (x86)\Heretic II
c:\tmp\bin\zip.exe -r -0 "Heretic II.zip" .
cd ..
move "Heretic II" ..\..\tmp\hereticiiold
c:\tmp\bin\unzip -LL "..\..\tmp\hereticiiold\Heretic II.zip" -d "Heretic II"
c:\tmp\bin\unzip -LL -o "..\..\tmp\patch\Heretic II.zip" -d "Heretic II"
title "installing Heretic II THF mod..."
c:\tmp\bin\unzip -LL -o "..\..\tmp\thf5\thf_5.zip" -d "Heretic II"
move "heretic ii\thf_5\client effects.dll" "heretic ii\thf_5\client effects.dll.bak"
