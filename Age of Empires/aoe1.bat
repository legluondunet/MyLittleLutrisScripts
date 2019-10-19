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
echo.	------------------------------------------------
echo.			Age of Empires I
echo.	------------------------------------------------
echo.
echo.	1) Age of Empires 1
echo.	2) Age of Empires 1: Rise of Rome
echo.	3) Exit
echo.
echo.	------------------------------------------------
echo.
echo.




choice /c123 /s /N Your choice? [1-3]:
if errorlevel 3 goto exit
if errorlevel 2 goto ror
if errorlevel 1 goto aoe1

:aoe1
cls
cd c:\dxwnd
start dxwnd.exe /r:1
goto exit

:ror
cls
cd c:\dxwnd
start dxwnd.exe /r:2
goto exit

:exit
exit
