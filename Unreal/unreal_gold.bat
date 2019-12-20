@echo off
color 06
c:\
goto launcher

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.		Unreal Gold - GOG - version 227i
echo.	------------------------------------------------
echo.
echo.	1) Play Unreal Gold (Windows version)
echo.	2) Play Unreal Gold (Linux version)
echo.	3) How to play Unreal Gold with a gamepad
echo.	4) exit
echo.
echo.	------------------------------------------------
echo.
echo.


choice /c1234 /s /N Your choice? [1-4]:
if errorlevel 4 goto :exit
if errorlevel 3 goto :gamepad
if errorlevel 2 goto :playlinux
if errorlevel 1 goto :play

:play
cd c:\GOG Games\Unreal Gold\System\
start Unreal.exe
goto :launcher

:playlinux
cd c:\GOG Games\Unreal Gold\
start /unix ./UnrealLinux.sh
goto :launcher

:gamepad
cls
start explorer "c:\GOG Games\Unreal Gold\gamepad profiles\"
start iexplore "c:\GOG Games\Unreal Gold\gamepad profiles\unreal_gamepad_readme.html"
goto launcher

:exit
exit

