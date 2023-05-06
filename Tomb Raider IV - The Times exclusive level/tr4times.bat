@echo off
color 0F

c:
cd "c:\The Times - Exclusive Tomb Raider Level"

goto launcher

:launcher

cls
echo.
echo.
echo.	------------------------------------------------
echo.	Tomb Raider IV - The Times exclusive level
echo.	------------------------------------------------
echo.
echo.	1) Tomb Raider IV - The Times exclusive level
echo.	2) Bonus: play Tomb Raider Jigsaw
echo.	3) Bonus: play Tomb Raider Clicker
echo.	4) Setup dialog box
echo.	5) How to play TR4 with a gamepad
echo.	6) Exit
echo.
echo.	------------------------------------------------
echo.
echo.




choice /c123456 /s /N Your choice? [1-6]:
if errorlevel 6 goto :exit
if errorlevel 5 goto :gamepad
if errorlevel 4 goto :setup
if errorlevel 3 goto :clicker
if errorlevel 2 goto :jigsaw
if errorlevel 1 goto :tr4times


:tr4times
start tomb4.exe
goto :launcher

:jigsaw
start jigsaw.exe
goto :launcher

:clicker
start clicker.exe
goto :launcher

:setup
cls
echo.
echo.
echo.	------------------------------------------------
echo.	Tomb Raider IV - The Times exclusive level
echo.	------------------------------------------------
echo.
echo. 	Setup:
echo.
echo.	Graphics Adapter	- choose ONLY dgVoodoo
echo.	Output Settings 	- choose ONLY dgVoodoo
echo.	Output Resolution	- choose your native desktop resolution
echo.	Texture Bit Depth	- choose 32RGBA for better texture quality
echo.	Others options		- You should not need to change others options
echo.
echo.	------------------------------------------------
echo.
echo.
start tomb4.exe -setup
pause
goto :launcher

:gamepad
start explorer c:\The Times - Exclusive Tomb Raider Level\gamepad profiles\
start iexplore c:\The Times - Exclusive Tomb Raider Level\gamepad profiles\tr4_gamepad_readme.html
goto launcher

:exit
exit
