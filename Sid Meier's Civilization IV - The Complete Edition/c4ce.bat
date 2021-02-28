@echo off
color 4E
c:
goto launcher
cd \

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.	 	CIVILIZATION IV Complete Edition
echo.	------------------------------------------------
echo.
echo.	1) Civilization IV
echo.	2) Civilization IV - Beyond Sword
echo.	3) Civilization IV - Warlords
echo.	4) Civilization IV - Colonization
echo.	5) Exit
echo.
echo.	------------------------------------------------
echo.
echo.




choice /c12345 /s /N Your choice? [1-5]:
if errorlevel 5 goto exit
if errorlevel 4 goto :4
if errorlevel 3 goto :3
if errorlevel 2 goto :2
if errorlevel 1 goto :1


:1
cls
cd "c:\gog games\civilization iv complete\civ4"
start civilization4.exe
goto launcher

:2
cls
cd "c:\gog games\civilization iv complete\civ4\beyond the sword"
start civ4beyondsword.exe
goto launcher


:3
cls
cd "c:\gog games\civilization iv complete\civ4\warlords"
start civ4warlords.exe
goto launcher


:4
cls
cd cd "c:\gog games\civilization iv complete\civ4colonization"
start colonization.exe
goto launcher


:exit
exit
