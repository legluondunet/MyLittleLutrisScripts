@echo off
color 0d
TITLE Heretic II

goto launcher

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.			HERETIC II v1.07
echo.	------------------------------------------------
echo.
echo.	1) Play Heretic II
echo.	2) Start Heretic server
echo.	3) Change resolution
echo.	4) FAQ/Known issues
echo.	5) exit
echo.
echo.	------------------------------------------------
echo.
echo.


choice /c12345 /s /N Your choice? [1-5]:
if errorlevel 5 goto exit
if errorlevel 4 goto faq
if errorlevel 3 goto resolution
if errorlevel 2 goto server
if errorlevel 1 goto heretic2

:heretic2
cls
c:
cd c:\dxwnd
start dxwnd.exe /r:0
goto launcher

:server
cls
echo.
echo.
echo.	------------------------------------------------
echo.			HERETIC II v1.07 server
echo.	------------------------------------------------
echo.
echo.	1) Start HERETIC II THF5 listen server
echo.	2) terminal DOS
echo.	3) return to main menu
echo.
echo.	------------------------------------------------
echo.
echo.


choice /c123 /s /N Your choice? [1-3]:
if errorlevel 3 goto launcher
if errorlevel 2 goto dos
if errorlevel 1 goto thf

:dos
cls
c:
cd c:\Program Files (x86)\Heretic II
start c:\windows\syswow64\wineconsole.exe
goto :server

:tmo
cls
echo. not yet available 
pause
goto :server

:emo
cls
echo. not yet available 
pause
goto :server

:thf
cls
c:
cd c:\dxwnd
start dxwnd.exe /r:2
goto :server

:resolution
cls
echo.
echo.
echo.	------------------------------------------------
echo.			HERETIC II v1.07
echo.	------------------------------------------------
echo.
echo. 	3) change resolution
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
h2resolution.exe
pause
goto launcher

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
c:
cd c:\Program Files (x86)\Heretic II\
iexplore faq.html
pause
goto launcher


:exit
exit
