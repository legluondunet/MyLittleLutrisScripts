@echo off
color 1F

c:
cd "c:\TR3TLA"

goto :launcher

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.	TOMB RAIDER III - The Lost Artefact
echo.	------------------------------------------------
echo.
echo.	1) Tomb Raider III - The Lost Artefact
echo.	2) Setup dialog box
echo.	3) How to play TR3TLA with a gamepad
echo.	4) Exit
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
start tomb3.exe -gold
goto :launcher

:setup
cls
echo.
echo.
echo.	------------------------------------------------
echo.	TOMB RAIDER III - The Lost Artefact
echo.	------------------------------------------------
echo.
echo.	Setup:
echo.
echo.	Graphics Adapter	- choose ONLY dgVoodoo
echo.	Output Settings 	- choose ONLY dgVoodoo
echo.	Output Resolution	- choose your native desktop resolution
echo.	Others options		- You should not need to change others options
echo.
echo.	------------------------------------------------
echo.
echo.
start tomb3.exe -setup
pause
goto :launcher


:gamepad
cls
start explorer c:\TR3TLA\gamepad profiles\
start iexplore c:\TR3TLA\gamepad profiles\tr3_gamepad_readme.html
pause
goto :launcher


:exit
exit
