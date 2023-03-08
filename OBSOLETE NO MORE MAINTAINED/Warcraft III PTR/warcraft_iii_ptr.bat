@echo off
TITLE Warcraft III
color 07

c:
cd \
copy warcraft_iiib.bmp warcraft_iii.bmp 
copy warcraft_iiia.bmp warcraft_iiib.bmp
copy warcraft_iii.bmp warcraft_iiia.bmp 

IF NOT EXIST "%PROGRAMDATA%\Blizzard Entertainment\Warcraft III\" md "%PROGRAMDATA%\Blizzard Entertainment\\Warcraft III Public Test\"
IF NOT EXIST "%PROGRAMDATA%\Blizzard Entertainment\Warcraft III Public Test\roc.w3k" goto :key
IF NOT EXIST "%PROGRAMDATA%\Blizzard Entertainment\Warcraft III Public Test\user.w3k" goto :key

goto :launcher

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.	      Warcraft III Blizzard digital edition
echo.	------------------------------------------------
echo.
echo.	1) Play Warcraft III - Reign of Chaos
rem echo.	2) Check update
echo.	2) Play Warcraft III - The Frozen Throne
echo.	3) Insert or change Warcraft III licence key
echo.	4) Exit
echo.
echo.	------------------------------------------------
echo.
echo.

choice /c1234 /s /N Your choice? [1-4]:
if errorlevel 4 goto :exit
if errorlevel 3 goto :key
rem if errorlevel 2 goto :update
if errorlevel 2 goto :playtft
if errorlevel 1 goto :playroc

:key
cls
echo.
echo.
echo.	------------------------------------------------
echo.	      Warcraft III Blizzard digital edition
echo.	------------------------------------------------
echo.

set Output="%PROGRAMDATA%\Blizzard Entertainment\Warcraft III Public Test\"

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

:playroc
reg add "HKCU\Software\Blizzard Entertainment\Warcraft III Public Test" /v "Preferred Game Version" /t REG_DWORD /d 0 /f
start "" "c:\program files\warcraft iii Public Test\x86_64\warcraft iii.exe"
goto :launcher

:playtft
reg add "HKCU\Software\Blizzard Entertainment\Warcraft III Public Test" /v "Preferred Game Version" /t REG_DWORD /d 1 /f
start "" "c:\program files\warcraft iii Public Test\x86_64\warcraft iii.exe"
goto :launcher

rem :update
rem start "" "c:\programdata\battle.net\agent\agent.exe"
rem ping 127.0.0.1 -n 2 > nul
rem start "" "c:\program files\warcraft iii\warcraft III launcher.exe"

:exit
exit
