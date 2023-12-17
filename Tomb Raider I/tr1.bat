
@echo off
color 0E

c:
cd c:\TOMBATI

goto :launcher

:launcher
cls
echo.
echo.
echo. ------------------------------------------------------
echo.	TOMB RAIDER I + TombATI + HD Textures
echo. ------------------------------------------------------
echo.
echo.	1) Play Tomb Raider I
echo.	2) Play Tomb Raider I Unfinished Business
echo.	3) Configure TombATI HD textures
echo.	4) How to play TR1 with a gamepad
echo.	5) Exit
echo.
echo. ------------------------------------------------------
echo.
echo.

choice /c12345 /s /N Your choice? [1-5]:
if errorlevel 5 goto exit
if errorlevel 4 goto gamepad
if errorlevel 3 goto config
if errorlevel 2 goto tombub
if errorlevel 1 goto tr1

:tr1
cls
copy /Y DATA\TITLEHTR1.PCX DATA\TITLEH.PCX
start tombati.exe
goto :launcher

:tombub
cls
copy /Y DATA\TITLEHTR1UB.PCX DATA\TITLEH.PCX
start tombub.exe
goto :launcher

:config
cls
echo.
echo.
echo. ------------------------------------------------------
echo.	TOMB RAIDER I + TombATI + HD Textures
echo. ------------------------------------------------------
echo.
echo.	Here you can select HD textures pack
echo.	Others textures packs available for download here:
echo.	https://www.tombraiderxtra.com/ 
echo.
echo. ------------------------------------------------------
echo.
echo.
start "" TombATIConfigure.exe
pause
goto :launcher

:gamepad
cls
start explorer c:\TOMBATI\gamepad profiles\
start iexplore c:\TOMBATI\gamepad profiles\tr1-2_gamepad_readme.html
goto :launcher

:exit
exit
