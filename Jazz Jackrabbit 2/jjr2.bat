cd "c:\dxwnd"
start "" dxwnd.exe
PING -n 3 127.0.0.1>nul
cd "c:\GOG Games\Jazz Jackrabbit 2"
start "" jazz2.exe
PING -n 3 127.0.0.1>nul
taskkill /F /IM dxwnd.exe

