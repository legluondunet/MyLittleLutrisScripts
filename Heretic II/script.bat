echo off
cd c:\tmp
pause
move "heretic ii\ht2_ep_v1-07.7z" .
pause
zip -r -0 hereticiioldinstall.zip "c:\program files (x86)\heretic ii"
pause
move "c:\program files (x86)\heretic ii" "c:\tmp\hereticiioldinstall"
pause
unzip -LL hereticii.zip -d ../
pause
zip -r -0 "heretic ii.zip" "heretic ii"
pause
unzip -LL -o "heretic ii.zip" -d "c:\program files (x86)"
