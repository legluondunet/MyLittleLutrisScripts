@echo off
color 0d
TITLE Heretic II
c:
cd c:\Program Files (x86)\Heretic II

goto launcher

:launcher
cls
echo.
echo.
echo.	------------------------------------------------
echo.			HERETIC 2 v1.07
echo.	------------------------------------------------
echo.
echo.	1) Play Heretic II
echo.  2) Start Heretic server
echo.	3) Change resolution
echo.	4) No soundtrack during game?
echo.	5) The game does not launch anymore
echo.	6) exit
echo.
echo.	------------------------------------------------
echo.
echo.


choice /c123456 /s /N Your choice? [1-6]:
if errorlevel 6 goto exit
if errorlevel 5 goto nostart
if errorlevel 4 goto sound
if errorlevel 3 goto resolution
if errorlevel 2 goto server
if errorlevel 1 goto heretic2

:heretic2
cls
start Heretic2.exe
goto exit

:server
cls
echo.
echo.
echo.	------------------------------------------------
echo.			HERETIC 2 v1.07 server
echo.	------------------------------------------------
echo.
echo.	1) Start HERETIC 2 THF5 dedicated server
echo. 2) Start HERETIC 2 THF5 listen server
echo.	3) return to main menu
echo.
echo.	------------------------------------------------
echo.
echo.


choice /c123 /s /N Your choice? [1-3]:
if errorlevel 3 goto launcher
if errorlevel 2 goto thfl
if errorlevel 1 goto thfd

:thfd
cls
server dedicated.bat
exit

:thfl
cls
server listen.bat
exit

:resolution
cls
echo.
echo.
echo.	------------------------------------------------
echo.			HERETIC 2 v1.07
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
h2resolution.exe
pause
goto launcher


:sound
cls
echo.
echo.
echo.	------------------------------------------------
echo.			HERETIC 2 v1.07
echo.	------------------------------------------------
echo.
echo. 	3) No soundtrack ingame?
echo.
echo.  Normally the Lutris script would have to rip the game soundtrack 
echo.  during the installation. If this is not the case, if you do not
echo.  hear the music during the game, rip audio game cd to wav format 
echo.  in separate files, call each track "01.wav", "02.wav" etc...
echo.  and put them in the main game folder:
echo.  c:\Program Files (x86)\Heretic II\
echo.  Launch the game you can now hear Heretic II soundtrack during gaming.
echo. 
echo.
pause
goto launcher


:nostart
cls
echo.
echo.
echo.	------------------------------------------------
echo.			HERETIC 2 v1.07
echo.	------------------------------------------------
echo.
echo. 	4) The game does not launch anymore
echo.
echo.  You tried to change some video options and the game does not 
echo.  launch anymore?
echo.  Delete the config.cfg file located in this folder:
echo.  c:\Program Files (x86)\Heretic II\user
echo.  Then the game launch normally. 
echo.
echo.
echo.
echo.
c:\windows\explorer.exe "c:\Program Files (x86)\Heretic II\user"
pause
goto launcher

:exit
exit
