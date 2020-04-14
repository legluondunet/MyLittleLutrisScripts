@echo off
color 08
c:\
goto launcher

:launcher
cls
echo.
echo.
echo.	--------------------------------------------------------------
echo.		   Quake - The Offering - GOG - Epsilon
echo.	--------------------------------------------------------------
echo.
echo.	1) Play Quake - The Offering - Windows version
echo.	2) Play QTO - Mission Pack 1 - Scourge of Armagon 
echo.	3) Play QTO - Mission Pack 2 - Dissolution of Eternity 
echo.	4) Play QTO - Mission Pack 3 - Abyss of Pandemonium 
echo.
echo.	--------------------------------------------------------------
echo.
echo.	5) Play Quake - The Offering - Linux version
echo.	6) Play QTO - Mission Pack 1 - Scourge of Armagon 
echo.	7) Play QTO - Mission Pack 2 - Dissolution of Eternity 
echo.	8) Play QTO - Mission Pack 3 - Abyss of Pandemonium 
echo.	9) exit
echo.
echo.	--------------------------------------------------------------
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
start darkplaces.exe -hipnotic
goto :launcher

:playwin3
cd c:\Epsilon
start darkplaces.exe -rogue
goto :launcher

:playwin4
cd c:\Epsilon
start darkplaces.exe -rogue -game abyss
goto :launcher

:playlinux5
cd c:\Epsilon
start /unix ./darkplaces-linux-x86_64-sdl
goto :launcher

:playlinux6
cd c:\Epsilon
start /unix ./darkplaces-linux-x86_64-sdl -hipnotic
goto :launcher

:playlinux7
cd c:\Epsilon
start /unix ./darkplaces-linux-x86_64-sdl -rogue
goto :launcher

:playlinux8
cd c:\Epsilon
start /unix ./darkplaces-linux-x86_64-sdl -rogue -game abyss
goto :launcher


:exit
exit

