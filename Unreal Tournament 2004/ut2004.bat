@echo off
color 0E
c:\
goto launcher

:launcher
cls
echo.
echo.
echo.	-----------------------------------------------------
echo.		     Unreal Tournament 2004 - GOG
echo.	-----------------------------------------------------
echo.
echo.	1) Play Unreal Tournament 2004 (Windows version)
echo.	2) Play Unreal Tournament 2004 (Linux version)
echo.	3) How to play Unreal Gold with a gamepad (TODO)
echo.	4) exit
echo.
echo.	-----------------------------------------------------
echo.
echo.


choice /c1234 /s /N Your choice? [1-4]:
if errorlevel 4 goto :exit
if errorlevel 3 goto :launcher
if errorlevel 2 goto :playlinux
if errorlevel 1 goto :play

:play
cd c:\GOG Games\Unreal Tournament 2004\System\
start UT2004.exe
goto :launcher

:playlinux
cd c:\GOG Games\Unreal Tournament 2004\System\
start /unix ./ut2004-bin-linux-amd64
goto :launcher

:gamepad
cls
start explorer "c:\GOG Games\Unreal Gold\gamepad profiles\"
start iexplore "c:\GOG Games\Unreal Gold\gamepad profiles\unreal_gamepad_readme.html"
goto launcher

:exit
exit

