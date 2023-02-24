@echo off
color 0E
goto launcher
c:

:launcher
cls
echo.
echo.
echo. ------------------------------------------------------
echo.	      TOMB RAIDER I GOG Edition + TOMB1Main
echo. ------------------------------------------------------
echo.
echo.	1) Play Tomb Raider I
echo.	2) Play Tomb Raider I Unfinished Business
echo.	3) Exit
echo.
echo. ------------------------------------------------------
echo.	script by Le Gluon du Net   
echo. ------------------------------------------------------
echo.
echo.

choice /c123 /s /N Your choice? [1-5]:
if errorlevel 3 goto exit
if errorlevel 2 goto tombub
if errorlevel 1 goto tr1

:tr1
cls
cd c:\tomb1main
rem copy /Y TITLEHTR1.PCX TITLEH.PCX
rem cd c:\TOMBATI\
start tomb1main.exe
goto launcher

:tombub
cls
cd c:\tomb1main
rem copy /Y TITLEHTR1UB.PCX TITLEH.PCX
start tomb1main.exe -gold
goto launcher

:exit
exit
