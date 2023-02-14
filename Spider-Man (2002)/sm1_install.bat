start "" setup.exe

:search
winedbg --command "info wnd" | find "Insert CD" 1>NUL 2>NUL
echo %errorlevel%
if %errorlevel% EQU 0 goto :kill
ping 127.0.0.1 -n 20 > nul
goto :search

:kill
taskkill /f /im "setup.exe"
exit
