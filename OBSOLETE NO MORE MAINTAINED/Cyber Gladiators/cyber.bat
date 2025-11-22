cd c:\dxwnd
start dxwnd.exe /r:0
cd "c:\sierra\cyber\"

goto :search

:search
set result=1
winedbg --command "info proc" | find cyber.exe
echo %errorlevel%
if %errorlevel% EQU 0 set result=0
ping 127.0.0.1 -n 1 > nul
echo  %result%
IF %result% NEQ 0 GOTO :search

nircmd.exe dlg "cyber.exe" "" click ok

exit
