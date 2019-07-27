@echo off
color 1F
goto launcher


:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.	TOMB RAIDER 3 - The Last Artefact - CD
echo.	------------------------------------------------
echo.
echo.	1) Tomb Raider 3 - The Last Artefact
echo.	2) Setup dialog box
echo.	3) How to play TR3TLA with a gamepad
echo.	4) exit
echo.
echo.	------------------------------------------------
echo.
echo.




choice /c1234 /s /N Your choice? [1-4]:
if errorlevel 4 goto exit
if errorlevel 3 goto gamepad
if errorlevel 2 goto setup
if errorlevel 1 goto tr3tla


:tr3tla
cls
start tr3gold.exe
goto exit


:setup
cls
start tr3gold.exe -setup
goto launcher


:gamepad
cls
start explorer c:\TR3TLA\gamepad profiles\
start iexplore c:\TR3TLA\gamepad profiles\tr3_gamepad_readme.html
goto launcher


:exit
exit
