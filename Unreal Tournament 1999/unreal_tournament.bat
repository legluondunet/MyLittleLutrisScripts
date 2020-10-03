@echo off
color 0F
c:
goto launcher

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.	Unreal Tournament (1999) - CD + OldUnreal patch
echo.	------------------------------------------------
echo.
echo.	1) Play Unreal Tournament (Windows version)
echo.	2) Play Unreal Tournament (Linux version)
echo.	3) How to play Unreal Gold with a gamepad (WIP)
echo.	4) exit
echo.
echo.	------------------------------------------------
echo.
echo.


choice /c1234 /s /N Your choice? [1-4]:
if errorlevel 4 goto :exit
if errorlevel 3 goto :gamepad
if errorlevel 2 goto :playlinux
if errorlevel 1 goto :playws

:playws
IF EXIST "c:\UnrealTournament\" (
  cd c:\UnrealTournament\System\
) ELSE (
  cd c:\GOG Games\Unreal Tournament GOTY\System\
)
start /unix modifyoptions.sh
start UnrealTournament.exe
goto :launcher

:playlinux
IF EXIST "c:\UnrealTournament\" (
  cd c:\UnrealTournament\System\
) ELSE (
  cd c:\GOG Games\Unreal Tournament GOTY\System\
)
start /unix ./ut-bin
goto :launcher

:gamepad
cls
rem start explorer "c:\GOG Games\Unreal Gold\gamepad profiles\"
rem start iexplore "c:\GOG Games\Unreal Gold\gamepad profiles\unreal_gamepad_readme.html"
goto launcher

:exit
exit

