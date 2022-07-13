@echo off
color 0f

c:

goto :launcher

:launcher
cls
echo.
echo.
echo.	-------------------------------------------------------------
echo.			     Honkai Impact 3rd
echo.	-------------------------------------------------------------
echo.
echo.	 1) Play Honkai Impact 3rd (patched)
echo.	 2) Update Honkai Impact 3rd (do not launch game)
echo.	 3) Exit
echo.
echo.	-------------------------------------------------------------
echo.
echo.
echo.  	 Your choice? [1-3]:

choice /s /N	/c12345
if errorlevel 3 goto :exit
if errorlevel 2 goto :update
if errorlevel 1 goto :play


:play
cd "c:\Program Files\Honkai Impact 3rd tw\Games"
start launcher.bat
goto :launcher

:update
cd "c:\Program Files\Honkai Impact 3rd tw"
start launcher.exe
goto :launcher

:exit
exit
