@echo off
color 0f

c:

goto :launcher

:launcher
cls
echo.
echo.
echo.	-------------------------------------------------------------
echo.			     Genshin Impact
echo.	-------------------------------------------------------------
echo.
echo.	 1) Play Genshin Impact (patched)
echo.	 2) Update Genshin Impact(do not launch game)
echo.	 3) Patch Genshin Impact
echo.	 4) Revert Genshin Impact patch
echo.	 5) Exit
echo.
echo.	-------------------------------------------------------------
echo.
echo.
echo.  	 Your choice? [1-5]:

choice /s /N	/c12345
if errorlevel 5 goto exit
if errorlevel 4 goto rpatch
if errorlevel 3 goto apatch
if errorlevel 2 goto update
if errorlevel 1 goto play


play:
cd "c:\Program Files\Genshin Impact\Genshin Impact game"
start launcher.bat

update:
cd "c:\Program Files\Genshin Impact"
start launcher.exe

apatch:
cd "c:\gi_patch_230"
start /unix ex_patch.sh
goto :launcher

rpatch:
cd "c:\gi_patch_230"
start /unix patch_revert.sh
goto :launcher

exit:
exit
