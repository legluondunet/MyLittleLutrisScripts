@echo off
TITLE Warcraft III
color 09

c:
cd \
copy warcraft_iiib.bmp warcraft_iii.bmp 
copy warcraft_iiia.bmp warcraft_iiib.bmp
copy warcraft_iii.bmp warcraft_iiia.bmp 


goto :launcher

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.	      Warcraft III Blizzard digital edition
echo.	------------------------------------------------
echo.
echo.	1) Play
echo.	2) Check update
echo.	3) exit
echo.
echo.	------------------------------------------------
echo.
echo.

choice /c123 /s /N Your choice? [1-3]:
if errorlevel 3 goto :exit
if errorlevel 2 goto :update
if errorlevel 1 goto :play

:play
"c:\program files\warcraft iii\x86_64\warcraft iii.exe"
goto :exit

:update
"c:\programdata\battle.net\agent\agent.exe"
ping 127.0.0.1 -n 2 > nul
"c:\program files\warcraft iii\warcraft III launcher.exe"

:exit
exit
