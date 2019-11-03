@echo off
color 06
c:
goto launcher

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.			Enclave
echo.	------------------------------------------------
echo.
echo.	1) Play Enclave
echo.	2) How to play Enclave with a gamepad
echo.	3) exit
echo.
echo.	------------------------------------------------
echo.
echo.


choice /c123 /s /N Your choice? [1-3]:
if errorlevel 3 goto :exit
if errorlevel 2 goto :gamepad
if errorlevel 1 goto :enclave

:enclave
cls
cd c:\dxwnd
start dxwnd.exe /r:0
goto exit

:gamepad
cls
start explorer "c:\enclave\gamepad profiles\"
start iexplore "c:\enclave\gamepad profiles\enclave_gamepad_readme.html"
goto launcher

:exit
exit
