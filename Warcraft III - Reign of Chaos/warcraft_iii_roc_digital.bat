@echo off
TITLE Warcraft III ROC
color 07

c:
cd \

if not exist "c:\program files (x86)\warcraft iii\warcraft iii.exe" goto :download
if not exist "c:\program files (x86)\warcraft iii\war3.exe" goto :download
start "" "c:\program files (x86)\warcraft iii\warcraft iii.exe" -opengl -window
goto :exit

:download
start "" "c:\program files (x86)\warcraft iii\w3roc.exe"
goto :exit

:exit
exit
