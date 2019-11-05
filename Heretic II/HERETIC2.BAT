@echo off
color 0d
TITLE Heretic II

c:

goto :launcher

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.			HERETIC II v1.07
echo.	------------------------------------------------
echo.
echo.	1) Play Heretic II
echo.	2) Change resolution
echo.	3) How to play Heretic II with a gamepad?
echo.	4) FAQ/Known issues
echo.	5) exit
echo.
echo.	------------------------------------------------
echo.
echo.


choice /c12345 /s /N Your choice? [1-5]:
if errorlevel 5 goto exit
if errorlevel 4 goto faq
if errorlevel 3 goto gamepad
if errorlevel 2 goto resolution
if errorlevel 1 goto heretic2

:heretic2
cls
cd c:\dxwnd
start dxwnd.exe /r:0
goto :exit

:resolution
cls
echo.
echo.
echo.	------------------------------------------------
echo.			HERETIC II v1.07
echo.	------------------------------------------------
echo.
echo. 	2) change resolution
echo.
echo. Enter your resolution into the Width and Height fields and press OK.
echo. To use special resolution, you have to select the 640 x 480 resolution
echo. in the Video Settings menu.
echo. Or if you prefer open console (press ~ or escape) and type in:
echo. set vid_mode 3 
echo.  
echo.
echo.
echo.
echo.
"c:\Program Files (x86)\Heretic II\h2resolution.exe"
pause
goto :launcher

:gamepad
cls
echo.
echo.
echo.	------------------------------------------------
echo.			HERETIC II v1.07
echo.	------------------------------------------------
echo.
echo. 	3) How to play Heretic II with a gamepad?
echo.
echo.  
echo.
echo.
echo.
echo.
start explorer c:\Program Files (x86)\Heretic II\gamepad profiles\
start iexplore c:\Program Files (x86)\Heretic II\gamepad profiles\h2_gamepad_readme.html
pause
goto :launcher

:faq
cls
echo.
echo.
echo.	------------------------------------------------
echo.			HERETIC II v1.07
echo.	------------------------------------------------
echo.
echo. 	4) FAQ/Know issues
echo.
echo.  
echo.
echo.
echo.
echo.
start iexplore c:\Program Files (x86)\Heretic II\faq.html
pause
goto :launcher


:exit
exit
