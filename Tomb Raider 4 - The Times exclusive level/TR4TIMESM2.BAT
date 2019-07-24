@echo off
color 0E
goto launcher


:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.	Tomb Raider 4 - The Times exclusive level
echo.	------------------------------------------------
echo.
echo.	1) Tomb Raider 4 - The Times exclusive level
echo.	2) Setup dialog box
echo.	3) Set ratio and FOV
echo.	4) How to play TR4 with a gamepad
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
if errorlevel 1 goto tr4times


:tr4times
cls
start tomb4.exe
goto exit


:setup
cls
start tomb4.exe -setup
goto launcher

:patch
cls
start TombRaider234_Patch.exe
pause
goto launcher

:gamepad
cls
start explorer c:\Program Files (x86)\Core Design\The Times - Exclusive Tomb Raider Level\gamepad profiles\
start iexplore c:\Program Files (x86)\Core Design\The Times - Exclusive Tomb Raider Level\gamepad profiles\tr4times_gamepad_readme.html
goto launcher

:exit
exit
