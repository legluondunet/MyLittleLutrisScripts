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
echo. 	3) About official CD update 1.27b
echo.	4) Exit
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
start "" "c:\program files (x86)\warcraft iii\warcraft iii.exe" -opengl
goto :launcher

:TFT
if not exist "c:\program files (x86)\warcraft iii\frozen throne.exe" goto :notft
start "" "c:\program files (x86)\warcraft iii\frozen throne.exe" -opengl
goto :launcher

:update
cls
start "" iexplore "https://gaming-tools.com/warcraft-3/patches/"
goto :launcher

:notft
cls
echo.
echo.
echo.	------------------------------------------------
echo.	    Warcraft III Blizzard CD Classic edition
echo.	------------------------------------------------
echo.
echo.	Warcraft III - The Frozen Throne extension is 
echo.	not installed.If you own the CD, install it with
echo. 	Lutris script installer called:
echo.	"Wine CD + patch 1.27b + WS version
echo.	available on this web page.
echo.
echo.	------------------------------------------------
echo.
echo.
start "" iexplore "https://lutris.net/games/warcraft-iii-the-frozen-throne/"
pause
goto :launcher

:exit
exit
