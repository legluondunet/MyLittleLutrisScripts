@echo off
color 0E
cd "c:\GOG Games\Indiana Jones and the Emperor's Tomb\sed4win"
call ijetniceconfig.bat
pause
goto launcher

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.	      Indiana Jones and the Emperor's Tomb
echo.	------------------------------------------------
echo.
echo.	1) Play IJET
echo.	2) How to play IJET with a gamepad?
echo.	3) exit
echo.
echo.	------------------------------------------------
echo.
echo.


choice /c123 /s /N Your choice? [1-3]:
if errorlevel 3 goto exit
if errorlevel 2 goto gamepad
if errorlevel 1 goto ijet

:ijet
cls
cd c:\dxwnd
start dxwnd.exe /r:0
goto exit

:gamepad
cls
start explorer c:\GOG Games\Indiana Jones and the Emperor's Tomb\gamepad profiles\
start iexplore c:\GOG Games\Indiana Jones and the Emperor's Tomb\gamepad profiles\ijet_gamepad_readme.html
goto launcher

:exit
exit
