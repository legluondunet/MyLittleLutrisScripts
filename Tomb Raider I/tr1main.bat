@echo off
color 0E

c:
cd c:\tomb1main

goto :launcher

:launcher
cls
echo.
echo.
echo. ------------------------------------------------------
echo.		TOMB RAIDER I + TOMB1Main
echo. ------------------------------------------------------
echo.
echo.	1) Play Tomb Raider I
echo.	2) Play Tomb Raider I Unfinished Business
echo.	3) Exit
echo.
echo. ------------------------------------------------------
echo.
echo.

choice /c123 /s /N Your choice? [1-3]:
if errorlevel 3 goto exit
if errorlevel 2 goto tombub
if errorlevel 1 goto tr1

:tr1
cls
start tomb1main.exe
goto :launcher

:tombub
cls
start tomb1main.exe -gold
goto :launcher

:exit
exit
