@echo off
goto launcher


:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.	TOMB RAIDER 2 GOG Edition
echo.	------------------------------------------------
echo.
echo.	1) Tomb Raider 2
echo.	2) Setup dialog box
echo.	4) How to play TR1 glATI with a gamepad
echo.	4) exit
echo.
echo.	------------------------------------------------
echo.
echo.




choice /c1234 /s /N Your choice? [1-4]:
if errorlevel 4 goto exit
if errorlevel 3 goto gamepad
if errorlevel 2 goto setup
if errorlevel 1 goto tr2


:tr2
cls
start Tomb2.exe
goto exit


:setup
cls
start Tomb2.exe -setup
goto launcher


:gamepad
cls
start explorer c:\GOG Games\Tomb Raider 2\gamepad profiles\
notepad c:\GOG Games\Tomb Raider 2\gamepad profiles\tr2_gamepad_profiles_readme.txt
goto launcher


:exit
exit
