@echo off
color 0E
c:
cd c:\GOG Games\Tomb Raider 5
goto launcher


:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.	TOMB RAIDER V - Chronicles
echo.	------------------------------------------------
echo.
echo.	1) Tomb Raider V - Chronicles
echo.	2) Setup dialog box
echo.	3) How to play TR5 with a gamepad
echo.	4) Exit
echo.
echo.	------------------------------------------------
echo.
echo.
echo.	Your choice [1-4]:

choice /c1234 /s /N	

if errorlevel 4 goto exit
if errorlevel 3 goto gamepad
if errorlevel 2 goto setup
if errorlevel 1 goto tr5


:tr5
cls
start pctomb5.exe
goto :launcher


:setup
cls
echo.
echo.
echo.	------------------------------------------------
echo.	TOMB RAIDER V - Chronicles - Setup
echo.	------------------------------------------------
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
start pctomb5.exe -setup
pause
goto :launcher

:gamepad
cls
start explorer c:\GOG Games\Tomb Raider 5\gamepad profiles\
start iexplore c:\GOG Games\Tomb Raider 5\gamepad profiles\tr5_gamepad_readme.html
goto launcher

:exit
exit
