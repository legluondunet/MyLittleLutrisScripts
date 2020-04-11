@echo off
c:
if exist "c:\Program Files (x86)\Steam\steamapps\common\L.A.Noire\3rd" copy /i /y "c:\Program Files (x86)\Steam\steamapps\common\L.A.Noire\3rdbak"
if exist "c:\Program Files (x86)\Steam\steamapps\common\L.A.Noire\3rd" rmdir /s /q "c:\Program Files (x86)\Steam\steamapps\common\L.A.Noire\3rd"
for /f "tokens=2* delims= " %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v personal') do set MyDocs="%%b"
echo My Documents points to %MyDocs%
if not exist %MyDocs%"\Rockstar Games\L.A. Noire\" mkdir %MyDocs%"\Rockstar Games\L.A. Noire\"
if not exist %MyDocs%"\Rockstar Games\L.A. Noire\settings.ini" copy "c:\tmp\settings.ini" %MyDocs%"\Rockstar Games\L.A. Noire\"
"c:\program files (x86)\steam\steam.exe" steam://run/8190




