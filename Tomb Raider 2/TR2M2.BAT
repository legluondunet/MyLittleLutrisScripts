@echo off
color 4E
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
echo.	2) Tomb Raider 2 - Golden Mask
echo.	3) Setup dialog box
echo.	4) How to play TR2 with a gamepad
echo.	5) exit
echo.
echo.	------------------------------------------------
echo.
echo.




choice /c12345 /s /N Your choice? [1-5]:
if errorlevel 5 goto exit
if errorlevel 4 goto gamepad
if errorlevel 3 goto setup
if errorlevel 2 goto tr2gm
if errorlevel 1 goto tr2


:tr2
cls
start Tomb2.exe
goto exit

:tr2gm
cls
start Tomb2.exe -gold
goto exit


:setup
cls
start Tomb2.exe -setup
goto launcher


:gamepad
cls
start explorer c:\GOG Games\Tomb Raider 2\gamepad profiles\
start iexplore c:\GOG Games\Tomb Raider 2\gamepad profiles\tr1-2_gamepad_readme.html
goto launcher


:exit
exit
