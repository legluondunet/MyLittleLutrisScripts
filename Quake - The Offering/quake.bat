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
echo.	5) Exit
echo.	--------------------------------------------------------------
echo.
echo.   Your choice? [1-5]: 
choice /c12345 /s /N 	
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

:exit
exit

