@echo off
color 4E

c:
cd "c:\tomb raider 2"

goto launcher

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.			TOMB RAIDER II
echo.	------------------------------------------------
echo.
echo.	1) Tomb Raider II
echo.	2) Tomb Raider II - Golden Mask
echo.	3) Setup dialog box
echo.	4) How to play TR2 with a gamepad
echo.	5) Exit
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
start tomb2.exe
goto :launcher

:tr2gm
cls
start tomb2.exe -gold
goto :launcher


:setup
cls
echo.
echo.
echo.	------------------------------------------------
echo.		TOMB RAIDER II - Setup
echo.	------------------------------------------------
echo.
echo.	Here just select your native Desktop resolution.
echo.	You should not need to change others options.
echo.
echo.	------------------------------------------------
echo.
echo.
start tomb2.exe -setup
pause
goto :launcher


:gamepad
cls
start explorer c:\tomb raider 2\gamepad profiles\
start iexplore c:\tomb raider 2\gamepad profiles\tr1-2_gamepad_readme.html
goto :launcher


:exit
exit
