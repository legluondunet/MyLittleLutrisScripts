@echo off
TITLE Warcraft III
color 07

c:
cd "c:\Program Files (x86)\warcraft III"
dir
if not exist "c:\Program Files (x86)\warcraft III\war3.exe" goto :dlroc
if not exist "c:\Program Files (x86)\warcraft III\warcraft iii.exe" goto :dlroc

:ROC
"c:\program files (x86)\warcraft iii\warcraft iii.exe"  -window -opengl
goto :exit

:dlroc
cls
echo.
echo.
echo.	-------------------------------------------------
echo.	Blizzard - Warcraft III - Classic/Digital edition
echo.	-------------------------------------------------
echo.
echo.   Downloading Warcraft III - Reign of Chaos...
echo.	
echo.	-------------------------------------------------
echo.
echo.
"c:\program files (x86)\warcraft iii\w3roc.exe"
goto :exit

:exit
exit
