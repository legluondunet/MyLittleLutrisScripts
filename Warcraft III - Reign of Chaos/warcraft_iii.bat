c:

start c:\programdata\battle.net\agent\agent.exe

goto :search

:search
set result=1
winedbg --command "info proc" | find Agent.exe
echo %errorlevel%
if %errorlevel% EQU 0 set result=0
winedbg --command "info proc" | find agent.exe
echo %errorlevel%
if %errorlevel% EQU 0 set result=0
ping 127.0.0.1 -n 2 > nul
echo  %result%
IF %result% NEQ 0 GOTO :search

call "warcraft III launcher.exe"

exit
