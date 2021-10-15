@echo off
color 0E
c:\
goto launcher

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.		Unreal Gold - version 227i - GOG
echo.	------------------------------------------------
echo.
echo.	1) Play Unreal Gold
echo.	2) How to play Unreal Gold with a gamepad
echo.	3) Exit
echo.
echo.	------------------------------------------------
echo.
echo.


choice /c123 /s /N Your choice? [1-3]:
if errorlevel 3 goto :exit
if errorlevel 2 goto :gamepad
if errorlevel 1 goto :play

:play
cd "c:\GOG Games\Unreal Gold\System\"
start Unreal.exe
goto :launcher

:gamepad
cls
start explorer "c:\GOG Games\Unreal Gold\gamepad profiles\"
start iexplore "c:\GOG Games\Unreal Gold\gamepad profiles\unreal_gamepad_readme.html"
goto launcher

:exit
exit

