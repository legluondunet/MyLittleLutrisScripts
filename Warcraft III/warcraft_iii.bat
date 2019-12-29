@echo off
TITLE Warcraft III
color 09

c:
cd \
copy warcraft_iiib.bmp warcraft_iii.bmp 
copy warcraft_iiia.bmp warcraft_iiib.bmp
copy warcraft_iii.bmp warcraft_iiia.bmp 

IF NOT EXIST "%PROGRAMDATA%\Blizzard Entertainment\Warcraft III\roc.w3k" goto :key
IF NOT EXIST "%PROGRAMDATA%\Blizzard Entertainment\Warcraft III\user.w3k" goto :key

goto :launcher

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.	      Warcraft III Blizzard digital edition
echo.	------------------------------------------------
echo.
echo.	1) Play
echo.	2) Check update
echo.	3) insert or change Warcraft III licence key
echo.	4) exit
echo.
echo.	------------------------------------------------
echo.
echo.

choice /c1234 /s /N Your choice? [1-4]:
if errorlevel 4 goto :exit
if errorlevel 3 goto :key
if errorlevel 2 goto :update
if errorlevel 1 goto :play

:key
if not exist "%PROGRAMDATA%\Blizzard Entertainment\Warcraft III\" md "%PROGRAMDATA%\Blizzard Entertainment\Warcraft III\"

cls
echo.
echo.
echo.	------------------------------------------------
echo.	      Warcraft III Blizzard digital edition
echo.	------------------------------------------------
echo.

set Output="%PROGRAMDATA%\Blizzard Entertainment\Warcraft III\"

set /p VarOne=	Please enter Warcraft III Reign of Chaos key: 
echo.
echo.
echo. 
set /p VarTwo=	Please enter a name (your name, your pet name, your computer name...): 

REM enter your desired output here
echo %VarOne% > %Output%\roc.w3k
echo %VarTwo% > %Output%\user.w3k
echo. 
echo. Done! Now press a key to return to main menu.
pause
goto :launcher

:play
"c:\program files\warcraft iii\x86_64\warcraft iii.exe"
goto :exit

:update
"c:\programdata\battle.net\agent\agent.exe"
ping 127.0.0.1 -n 2 > nul
"c:\program files\warcraft iii\warcraft III launcher.exe"

:exit
exit
