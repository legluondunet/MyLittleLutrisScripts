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
echo.	3) Tomb Raider 2-3-4 Widescreen Patch
echo.	4) exit
echo.
echo.	------------------------------------------------
echo.
echo.




choice /c1234 /s /N Your choice? [1-4]:
if errorlevel 4 goto exit
if errorlevel 3 goto wsp
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


:wsp
cls
widescreen_tomb_raider_234.exe
goto launcher


:exit
exit
