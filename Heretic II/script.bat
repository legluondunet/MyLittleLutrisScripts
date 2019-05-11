echo off
cd c:\tmp
move "heretic ii\ht2_ep_v1-07.7z" .
zip -r -0 hereticiioldinstall.zip "c:\program files (x86)\heretic ii"
move "c:\program files (x86)\heretic ii" "c:\tmp\hereticiioldinstall"
unzip -LL hereticii.zip -d ../
zip -r -0 "heretic ii.zip" "heretic ii"
unzip -LL -o "heretic ii.zip" -d "c:\program files (x86)"
