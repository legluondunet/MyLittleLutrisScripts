@echo off
color 0f
c:

rem for /f "tokens=2* delims= " %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v personal') do set MyDocs="%%b"
rem echo My Documents points to %MyDocs%

rem echo userprofile points to %userprofile%

rem if game is not installed start directly downloading
if not exist "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\" goto :play1

goto :launcher

:launcher
rem create config folder
if not exist "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars Le Pouvoir de la Force" mkdir "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars Le Pouvoir de la Force\"
if not exist "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars The Force Unleashed\" mkdir "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars The Force Unleashed\"

rem do not launch dotnet installing at each game start
if exist "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\Support\dotnet\dotnetfx35.exe" move /Y "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\Support\dotnet\dotnetfx35.exe" "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\Support\dotnet\dotnetfx35.bak"

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
echo.	4) Exit
echo.
echo.	-------------------------------------------------------
echo.
echo.

choice /c1234 /s /N Your choice? [1-4]:
if errorlevel 4 goto :exit
if errorlevel 3 goto :config
if errorlevel 2 goto :play2
if errorlevel 1 goto :play1

:play1
cd c:\tmp
c:\tmp\sed.exe -i "s/IsKBAndMouse\".*/IsKBAndMouse\">TRUE<\/s>/g" c:\tmp\config.xml
copy /Y "c:\tmp\Config.xml" "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars Le Pouvoir de la Force\Config.xml"
copy /Y "c:\tmp\Config.xml" "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars The Force Unleashed\Config.xml"
start "" "c:\program files (x86)\steam\steam.exe" -no-cef-sandbox steam://run/32430
goto :launcher

:play2
c:\tmp\sed.exe -i "s/IsKBAndMouse\".*/IsKBAndMouse\">FALSE<\/s>/g" c:\tmp\config.xml
copy /Y "c:\tmp\Config.xml" "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars Le Pouvoir de la Force\Config.xml"
copy /Y "c:\tmp\Config.xml" "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars The Force Unleashed\Config.xml"
start "" "c:\program files (x86)\steam\steam.exe" -no-cef-sandbox steam://run/32430
goto :launcher

:config
notepad.exe c:\tmp\Config.xml
copy /Y "c:\tmp\Config.xml" "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars Le Pouvoir de la Force\Config.xml"
copy /Y "c:\tmp\Config.xml" "%userprofile%\Local Settings\Application Data\Aspyr\Star Wars The Force Unleashed\Config.xml"
goto :launcher

:exit
call taskkill /F /IM steam.exe
call taskkill /F /IM steamwebhelper.exe
exit



