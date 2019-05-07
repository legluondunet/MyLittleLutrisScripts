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
echo.	4) exit
echo.
echo.	------------------------------------------------
echo.
echo.


choice /c1234 /s /N Your choice? [1-4]:
if errorlevel 4 goto exit
if errorlevel 3 goto config
if errorlevel 2 goto tombub
if errorlevel 1 goto tr1

:tr1
cls
tombati.exe
goto exit

:tombub
cls
tombub.exe
goto exit

:config
cls
TombATIConfigure.exe
goto launcher

:exit
exit
