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
echo.	2) How to play Heretic II with a gamepad?
echo.	3) FAQ/Known issues
echo.	4) Exit
echo.
echo.	------------------------------------------------
echo.
echo.


choice /c1234 /s /N Your choice? [1-4]:
if errorlevel 4 goto exit
if errorlevel 3 goto faq
if errorlevel 2 goto gamepad
if errorlevel 1 goto heretic2

:heretic2
cls
cd c:\dxwnd
start dxwnd.exe /r:0
goto :launcher

:gamepad
cls
echo.
echo.
echo.	------------------------------------------------
echo.			HERETIC II v1.07
echo.	------------------------------------------------
echo.
echo. 	2) How to play Heretic II with a gamepad?
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
echo. 	3) FAQ/Know issues
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
