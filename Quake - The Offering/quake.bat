@echo off
color 0b
c:\
goto launcher

:launcher
cls
echo.
echo.
echo.	-----------------------------------------------------
echo.		 Quake - The Offering - GOG - Epsilon
echo.	-----------------------------------------------------
echo.
echo.	1) Play Quake - The Offering (Windows version)
echo.	2) Play Quake - The Offering - MP1 (Windows version)
echo.	3) Play Quake - The Offering - MP2 (Windows version)
echo.	4) Play Quake - The Offering - MP3 (Windows version)
echo.
echo.			Linux
echo.	5) Play Unreal Tournament 2004 (Linux version)
echo.	6) Play Quake - The Offering - MP1 (Linux version)
echo.	7) Play Quake - The Offering - MP2 (Linux version)
echo.	8) Play Quake - The Offering - MP3 (Linux version)
echo.	9) exit
echo.
echo.	-----------------------------------------------------
echo.
echo.   Your choice? [1-9]: 
choice /c123456789 /s /N 	
if errorlevel 9 goto :exit
if errorlevel 8 goto :playlinux8
if errorlevel 7 goto :playlinux7
if errorlevel 6 goto :playlinux6
if errorlevel 5 goto :playlinux5
if errorlevel 4 goto :playwin4
if errorlevel 3 goto :playwin3
if errorlevel 2 goto :playwin2
if errorlevel 1 goto :playwin


:playwin
cd c:\Epsilon
start darkplaces.exe
goto :launcher

:playwin2
cd c:\Epsilon
start darkplaces.exe -game rogue
goto :launcher

:playwin3
cd c:\Epsilon
start darkplaces.exe -game hipnotic
goto :launcher

:playwin4
cd c:\Epsilon
start darkplaces.exe -game abyss
goto :launcher

:playlinux5
cd c:\Epsilon
start /unix ./darkplaces-linux-x86_64-sdl
goto :launcher

:playlinux6
cd c:\Epsilon
start /unix ./darkplaces-linux-x86_64-sdl -game rogue
goto :launcher

:playlinux7
cd c:\Epsilon
start /unix ./darkplaces-linux-x86_64-sdl -game hipnotic
goto :launcher

:playlinux8
cd c:\Epsilon
start /unix ./darkplaces-linux-x86_64-sdl -game abyss
goto :launcher



:exit
exit

