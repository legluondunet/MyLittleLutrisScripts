rem @echo off
c:
cd c:\tmp\patch
move ht2_ep_v1-07.7z ..
c:\tmp\bin\zip -r -0 "Heretic II.zip" .
cd c:\Program Files (x86)\Heretic II
c:\tmp\bin\zip.exe -r -0 "Heretic II.zip" .
cd ..
move "Heretic II" ..\..\tmp\hereticiiold
c:\tmp\bin\unzip -LL "..\..\tmp\hereticiiold\Heretic II.zip" -d "Heretic II"
c:\tmp\bin\unzip -LL -o "..\..\tmp\patch\Heretic II.zip" -d "Heretic II"
c:\tmp\bin\unzip -LL -o "..\..\tmp\thf5\thf_5.zip" -d "Heretic II"
