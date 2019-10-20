@echo off
color 0f

c:
cd c:\aoe1covers
copy 1.bmp ..\aoe1.bmp
move 1.bmp 1a.bmp
move 3.bmp 1.bmp
move 2.bmp 3.bmp
move 1a.bmp 2.bmp
cd ..
goto :launcher

:launcher
cls
echo.
echo.
echo.	----------------------------------------------------
echo.			Age of Empires I
echo.	----------------------------------------------------
echo.
echo.	 1) Age of Empires I 1.0c
echo.    2) Age of Empires I: Rise of Rome 1.0a
echo.	 3) Age of Empires I: Rise of Rome Upatch HD 1.1-R4
echo.	 4) Exit
echo.
echo.	----------------------------------------------------
echo.
echo.




choice /c1234 /s /N Your choice? [1-4]:
if errorlevel 4 goto exit
if errorlevel 3 goto upatch
if errorlevel 2 goto ror
if errorlevel 1 goto aoe1

:aoe1
cls
cd c:\dxwnd
start dxwnd.exe /r:1
goto :exit

:ror
cls
cd c:\dxwnd
start dxwnd.exe /r:2
goto :exit

:upatch
cls
if not exist "c:\program files (x86)\microsoft games\age of empires\gamex" goto :notinstall
goto :launchpatchhd

:notinstall
cls
echo.
echo.
echo.	------------------------------------------------
echo.			Age of Empires I
echo.	------------------------------------------------
echo.
echo. 	Upatch HD 1.1-R4 update is not yet installed.
echo.	You could install it freely from 
echo.	"Ages of Empires" Lutris page.
echo.
echo.
echo.
pause
goto :launcher

:choice
cls
echo.
echo.
echo.	------------------------------------------------
echo.			Age of Empires I
echo.	------------------------------------------------
echo.
echo. 	Upatch HD 1.1-R4 update is not yet installed,
set /P c=	do you want to install it now? [Y-N]
if /I "%c%" EQU "Y" goto :install
if /I "%c%" EQU "N" goto :launcher
goto :choice

:install
cd "c:\program files (x86)\microsoft games\age of empires\"
"UPatch HD 1.1-R4 Setup.exe"
goto :launcher

:launchpatchhd
cd "c:\program files (x86)\microsoft games\age of empires\gamex"
start launcher.exe
goto :exit



:exit
exit
