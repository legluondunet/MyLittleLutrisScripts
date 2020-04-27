@echo off
TITLE Warcraft III
color 07

c:
cd \
copy warcraft_iiib.bmp warcraft_iii.bmp 
copy warcraft_iiia.bmp warcraft_iiib.bmp
copy warcraft_iii.bmp warcraft_iiia.bmp 

goto :launcher

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.	    Warcraft III Blizzard CD Classic edition
echo.	------------------------------------------------
echo.
echo.	1) Play Warcraft III - Reign Of Chaos
echo.	2) Play Warcraft III - The Frozen Throne
echo. 	3) About official CD update 2.27b
echo.	4) exit
echo.
echo.	------------------------------------------------
echo.
echo.

choice /c1234 /s /N Your choice? [1-4]:
if errorlevel 4 goto :exit
if errorlevel 3 goto :update
if errorlevel 2 goto :TFT
if errorlevel 1 goto :ROC

:ROC
start "" "c:\program files (x86)\warcraft iii\warcraft iii.exe"
goto :launcher

:TFT
rem start "" "c:\program files (x86)\warcraft iii\warcraft iii.exe"
goto :launcher

:update
cls
start "" iexplore "https://gaming-tools.com/warcraft-3/patches/"
goto :launcher


:exit
exit
