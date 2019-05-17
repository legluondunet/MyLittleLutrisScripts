@echo off
color 0d
TITLE Heretic II
nircmd win hide ititle "Heretic II"
nircmd.exe win -style title "Heretic II" 0x00C00000 
nircmd win setsize ititle "Heretic II" 10 520 650 470
nircmd win show ititle "Heretic II"
nircmd win trans ititle "Heretic II" 10
nircmd win focus ititle "Heretic II"
c:
cd c:\Program Files (x86)\Heretic II\
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
echo.	2) Change resolution
echo.	3) No soundtrack during game?
echo.	4) The game does not launch anymore
echo.	5) exit
echo.
echo.	------------------------------------------------
echo.
echo.


choice /c12345 /s /N Your choice? [1-5]:
if errorlevel 5 goto exit
if errorlevel 4 goto nostart
if errorlevel 3 goto sound
if errorlevel 2 goto resolution
if errorlevel 1 goto heretic2

:heretic2
cls
start Heretic2.exe
goto exit

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
echo. Launch the game and select the 640 x 480 resolution in the Video 
echo. Settings menu.
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
echo.  It is a known issue for this game, not only on Linux.
echo.  But there is a workaround: rip audio game cd to wav format 
echo.  in separate files, call each track "01.wav", "02.wav" etc...
echo.  and put them in the aim game folder:
echo.  c:\Program Files (x86)\Heretic II\
echo.  Launch the game you can now play with Heretic II soundtrack.
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
