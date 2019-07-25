@echo off
color 0F
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
echo.	2) Bonus: play Tomb Raider Jigsaw
echo.	3) Bonus: play Tomb Raider Clicker
echo.	4) Setup dialog box
echo.	5) Set ratio and FOV
echo.	6) How to play TR4 with a gamepad
echo.	7) exit
echo.
echo.	------------------------------------------------
echo.
echo.




choice /c1234567 /s /N Your choice? [1-7]:
if errorlevel 7 goto exit
if errorlevel 6 goto gamepad
if errorlevel 5 goto patch
if errorlevel 4 goto setup
if errorlevel 3 goto clicker
if errorlevel 2 goto jigsaw
if errorlevel 1 goto tr4times


:tr4times
cls
start tomb4.exe
goto exit

:jigsaw
cls
start jigsaw.exe
goto launcher

:clicker
cls
start clicker.exe
goto launcher

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
