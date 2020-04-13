@echo off
c:

for /f "tokens=2* delims= " %%a in ('reg query "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Shell Folders" /v personal') do set MyDocs="%%b"
echo My Documents points to %MyDocs%

"c:\program files (x86)\steam\steam.exe" -no-browser steam://run/220240




