@echo off
color 0B
goto launcher


:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.	TOMB RAIDER V - Chronicles
echo.	------------------------------------------------
echo.
echo.	1) Tomb Raider V - Chronicles
echo.	2) Setup dialog box
echo.	3) Set ratio and FOV
echo.	4) How to play TR5 with a gamepad
echo.	5) exit
echo.
echo.	------------------------------------------------
echo.
echo.




choice /c12345 /s /N Your choice? [1-5]:
if errorlevel 5 goto exit
if errorlevel 4 goto gamepad
if errorlevel 3 goto patch
if errorlevel 2 goto setup
if errorlevel 1 goto tr5


:tr5
cls
start pctomb5.exe
goto exit


:setup
cls
start pctomb5.exe -setup
goto launcher

:patch
cls
start TombRaider234_Patch.exe
pause
goto launcher

:gamepad
cls
start explorer c:\GOG Games\Tomb Raider 5\gamepad profiles\
start iexplore c:\GOG Games\Tomb Raider 5\gamepad profiles\tr5c_gamepad_readme.html
goto launcher

:exit
exit
