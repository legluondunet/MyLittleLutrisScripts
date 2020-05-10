@echo off
c:

for /f "tokens=2* delims= " %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v personal') do set MyDocs="%%b"
echo My Documents points to %MyDocs%

if not exist "%appdata%\Aspyr\Star Wars Le Pouvoir de la Force" mkdir "%appdata%\Aspyr\Star Wars Le Pouvoir de la Force\"
if not exist "%appdata%\Aspyr\Star Wars The Force Unleashed\" mkdir "%appdata%\Aspyr\Star Wars The Force Unleashed\"
if not exist "%appdata%\Aspyr\Star Wars Le Pouvoir de la Force\Config.xml" copy c:\tmp\Config.xml "%appdata%\Aspyr\Star Wars Le Pouvoir de la Force\"
if not exist "%appdata%\Star Wars The Force Unleashed\Config.xml" copy copy c:\tmp\Config.xml "%appdata%\Aspyr\Star Wars The Force Unleashed\"
echo appdata points to %appdata%


"c:\program files (x86)\steam\steam.exe" -no-browser steam://run/32430





