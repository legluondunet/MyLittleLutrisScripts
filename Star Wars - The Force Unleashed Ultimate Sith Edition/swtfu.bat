@echo off
c:

for /f "tokens=2* delims= " %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v personal') do set MyDocs="%%b"
echo My Documents points to %MyDocs%

if not exist "%appdata%\Aspyr\Star Wars Le Pouvoir de la Force" mkdir "%appdata%\Aspyr\Star Wars Le Pouvoir de la Force\"
if not exist "%appdata%\Aspyr\Star Wars The Force Unleashed\" mkdir "%appdata%\Aspyr\Star Wars The Force Unleashed\"
if not exist "%appdata%\Aspyr\Star Wars Le Pouvoir de la Force\Config.xml" copy "c:\tmp\Config.xml" "%appdata%\Aspyr\Star Wars Le Pouvoir de la Force\"
if not exist "%appdata%\Star Wars The Force Unleashed\Config.xml" copy "c:\tmp\Config.xml" "%appdata%\Aspyr\Star Wars The Force Unleashed\"

if exist "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\Support\dotnet\dotnetfx35.exe" move /Y "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\Support\dotnet\dotnetfx35.exe" "c:\Program Files (x86)\Steam\steamapps\Common\Star Wars The Force Unleashed\Support\dotnetfx35.bak"


echo appdata points to %appdata%


"c:\program files (x86)\steam\steam.exe" -no-browser steam://run/32430





