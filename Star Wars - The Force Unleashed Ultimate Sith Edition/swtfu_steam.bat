@echo off
title Star Wars - The Force Unleashed - Ultimate Sith Edition
color FC
c:

rem if game oe Steam are not installed 
if not exist "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\" goto :firstlaunch

goto :launcher

:launcher
rem create config folder
if not exist "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars Le Pouvoir de la Force" mkdir "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars Le Pouvoir de la Force\"
if not exist "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars The Force Unleashed\" mkdir "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars The Force Unleashed\"
if not exist "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars Il Potere della Forza\" mkdir "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars Il Potere della Forza\"
if not exist "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars El Poder de la Fuerza\" mkdir "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars El Poder de la Fuerza\"

rem do not launch dotnet installing or change language at each game start
if exist "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\installscript.vdf" move /Y "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\installscript.vdf" "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\installscript.bak"

rem replace game launcher that is not compatible with wine by main game exe
if not exist "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\SWTFU.ori" copy "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\SWTFU.exe" "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\SWTFU.ori" & move /Y "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\SWTFU Launcher.exe" "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\SWTFU Launcher.ori"

copy /y "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\SWTFU.ori" "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\SWTFU Launcher.exe"

rem copy last levels update
copy /y "c:\tmp\swtfu_fixed_files\*" "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\LevelPacks\"

cls
echo.
echo.
echo.	-------------------------------------------------------
echo.	Star Wars - The Force Unleashed - Ultimate Sith Edition
echo.	-------------------------------------------------------
echo.
echo.	1) Play with keyboard and mouse
echo.	2) Play with x360 compatible controller
echo.	3) Edit game config
echo.	4) Change game language
echo.	5) Exit
echo.
echo.	-------------------------------------------------------
echo.
echo.

choice /c12345 /s /N Your choice? [1-5]:
if errorlevel 5 goto :exit
if errorlevel 4 goto :language
if errorlevel 3 goto :config
if errorlevel 2 goto :play2
if errorlevel 1 goto :play1

:firstlaunch
c:\tmp\sed.exe -i "s/IsKBAndMouse\".*/IsKBAndMouse\">TRUE<\/s>/g" c:\tmp\config.xml & call :copyconfig
call "c:\program files (x86)\steam\steam.exe" -no-cef-sandbox steam://run/32430 & goto :exit

:play1
c:\tmp\sed.exe -i "s/IsKBAndMouse\".*/IsKBAndMouse\">TRUE<\/s>/g" c:\tmp\config.xml & call :copyconfig
start "" "c:\program files (x86)\steam\steam.exe" -no-cef-sandbox steam://run/32430
goto :launcher

:play2
c:\tmp\sed.exe -i "s/IsKBAndMouse\".*/IsKBAndMouse\">FALSE<\/s>/g" c:\tmp\config.xml & call :copyconfig
start "" "c:\program files (x86)\steam\steam.exe" -no-cef-sandbox steam://run/32430
goto :launcher

:config
notepad.exe c:\tmp\Config.xml & call :copyconfig
goto :launcher

:language
cls
echo.
echo.
echo.	-------------------------------------------------------
echo.	Star Wars - The Force Unleashed - Ultimate Sith Edition
echo.	-------------------------------------------------------
echo.
echo.	1) English
echo.	2) French
echo.	3) German
echo.	4) Italian
echo.	5) Spanish
echo.	6) Polish
echo.	7) Russian
echo.	8) Go back to main menu
echo.
echo.	-------------------------------------------------------

for /F "skip=2 tokens=3" %%A in ('reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\aspyr\star wars the force unleashed" /v "Language"') do (
set varlang1=%%A
call :whichlang %%A
)
echo.	The game language is actually set to %varlang2%  (%varlang1%)

echo.	Choose your new preferred language for menus, subtitles
echo. 	and cutscenes:
echo.
choice /c12345678 /s /N     Your choice? [1-8]:

if errorlevel 8 goto :launcher
if errorlevel 7 call :lang ru & goto :language
if errorlevel 6 call :lang pl & goto :language
if errorlevel 5 call :lang es & goto :language
if errorlevel 4 call :lang it & goto :language
if errorlevel 3 call :lang de & goto :language
if errorlevel 2 call :lang fr & goto :language
if errorlevel 1 call :lang en & goto :language

:lang
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\aspyr\star wars the force unleashed" /t REG_SZ /v Language /d %1 /f
call :whichlang %1
set varlang1=%1
echo The game language is now actually set to %varlang2%  %varlang1%
pause
goto :eof

:whichlang
if "%1" == "en" set varlang2=English 
if "%1" == "fr" set varlang2=French
if "%1" == "de" set varlang2=German
if "%1" == "it" set varlang2=Italian
if "%1" == "es" set varlang2=Spanish
if "%1" == "pl" set varlang2=Polish
if "%1" == "ru" set varlang2=Russian
goto :eof

:copyconfig
copy /Y "c:\tmp\Config.xml" "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars Le Pouvoir de la Force\Config.xml"
copy /Y "c:\tmp\Config.xml" "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars The Force Unleashed\Config.xml"
goto :eof

:exit
call taskkill /F /IM steam.exe
call taskkill /F /IM steamwebhelper.exe
exit

