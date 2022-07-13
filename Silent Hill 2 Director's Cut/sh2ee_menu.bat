@echo off
color 0C

c:

goto :launcher

:launcher
cls
echo.
echo.
echo.	-------------------------------------------------------------
echo.			Silent Hill 2 Enhanced Edition
echo.	-------------------------------------------------------------
echo.
echo.	 1) Play Silent Hill 2 Enhanced Edition
echo.	 2) SH2EE Setup Tool (config, update, install, repair...)
echo.	 3) Exit
echo.
echo.	-------------------------------------------------------------
echo.
echo.
echo.  	 Your choice? [1-3]:

choice /s /N	/c12345
if errorlevel 3 goto :exit
if errorlevel 2 goto :setuptool
if errorlevel 1 goto :play


:play
cd "c:\Program Files (x86)/Konami/Silent Hill 2 - Directors Cut"
start sh2pc.exe
goto :launcher

:setuptool
cd "c:\Program Files (x86)/Konami/Silent Hill 2 - Directors Cut"
start SH2EEsetup.exe
goto :launcher

:exit
exit

