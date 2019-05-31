cd c:\dxwnd
start dxwnd.exe /r:0
cd "c:\sierra\cyber\"
ping 127.0.0.1 -n 2 > nul
nircmd.exe dlg "cyber.exe" "" click ok
