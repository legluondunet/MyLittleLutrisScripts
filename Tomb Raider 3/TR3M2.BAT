@echo off
goto launcher


:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.	TOMB RAIDER 3 GOG Edition
echo.	------------------------------------------------
echo.
echo.	1) Tomb Raider 3
echo.	2) Setup dialog box
echo.	3) How to play TR3 with a gamepad
echo.	4) exit
echo.
echo.	------------------------------------------------
echo.
echo.




choice /c1234 /s /N Your choice? [1-4]:
if errorlevel 4 goto exit
if errorlevel 3 goto gamepad
if errorlevel 2 goto setup
if errorlevel 1 goto tr3


:tr3
cls
start Tomb3.exe
goto exit


:setup
cls
start Tomb3.exe -setup
goto launcher


:gamepad
cls
start explorer c:\GOG Games\Tomb Raider 3\gamepad profiles\
notepad c:\GOG Games\Tomb Raider 3\gamepad profiles\tr3_gamepad_profiles_readme.txt
goto launcher


:exit
exit
