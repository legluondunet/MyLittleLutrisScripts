@echo off
color 0F
c:
goto launcher

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.	   Unreal Tournament (1999) + OldUnreal patch
echo.	------------------------------------------------
echo.
echo.	1) Play Unreal Tournament (Windows version)
echo.	2) Play Unreal Tournament (Linux version)
echo.	3) Exit
echo.
echo.	------------------------------------------------
echo.
echo.


choice /c123 /s /N Your choice? [1-3]:
if errorlevel 3 goto :exit
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

:exit
exit

