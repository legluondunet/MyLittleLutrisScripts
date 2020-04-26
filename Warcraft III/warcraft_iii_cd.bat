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
echo.	1) Play ROC
echo.	2) Play TFT
echo.	3) exit
echo.
echo.	------------------------------------------------
echo.
echo.

choice /c123 /s /N Your choice? [1-3]:
if errorlevel 3 goto :exit
if errorlevel 2 goto :TFT
if errorlevel 1 goto :ROC

:ROC
start "" "c:\program files (x86)\warcraft iii\warcraft iii.exe"
goto :launcher

:TFT
start "" "c:\program files (x86)\warcraft iii\warcraft iii.exe"
goto :launcher

:exit
exit
