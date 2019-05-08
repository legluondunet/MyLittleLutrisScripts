@echo off
goto launcher

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.	TOMB RAIDER 1 GOG Edition + GLRage + HD Textures
echo.	------------------------------------------------
echo.
echo.	1) Tomb Raider 1 GLRage
echo.	2) Tomb Raider 1 Unfinished Business GLRage
echo.	3) TombATI configure HD textures
echo.	4) How to play TR1 glATI with a gamepad
echo.	5) exit
echo.
echo.	------------------------------------------------
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
cd c:\TOMBATI\DATA
copy /Y TITLEHTR1.PCX TITLEH.PCX
cd c:\TOMBATI\
start tombati.exe
goto exit

:tombub
cls
cd c:\TOMBATI\DATA
copy /Y TITLEHTR1UB.PCX TITLEH.PCX
cd c:\TOMBATI\
start tombub.exe
goto exit

:config
cls
TombATIConfigure.exe
goto launcher

:gamepad
cls
start explorer c:\TOMBATI\gamepad profiles\
notepad c:\TOMBATI\gamepad profiles\tr1_glati_gamepad_profiles_readme.txt
goto launcher

:exit
exit
