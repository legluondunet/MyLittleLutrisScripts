cd c:\dxwnd
start dxwnd.exe /r:0
cd "c:\GOG Games\Syberia"

goto :search

:search
set result=1
winedbg --command "info proc" | find game.exe
echo %errorlevel%
if %errorlevel% EQU 0 set result=0
winedbg --command "info proc" | find Game.exe
echo %errorlevel%
if %errorlevel% EQU 0 set result=0
ping 127.0.0.1 -n 2 > nul
echo  %result%
IF %result% NEQ 0 GOTO :search


start nircmd.exe cmdwait 1000 win hide title Syberia
start nircmd.exe cmdwait 1000 win hideshow title Syberia

exit
