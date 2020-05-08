@echo off
c:

for /f "tokens=2* delims= " %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v personal') do set MyDocs="%%b"
echo My Documents points to %MyDocs%

if not exist %MyDocs%"\My Games\Far Cry 3" mkdir %MyDocs%"\My Games\Far Cry 3"
if not exist %MyDocs%"\My Games\Far Cry 3" copy "c:\tmp\GamerProfile.xml" %MyDocs%"\My Games\Far Cry 3"

"c:\program files (x86)\steam\steam.exe" -no-browser steam://run/220240




