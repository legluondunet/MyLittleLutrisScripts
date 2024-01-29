@echo off
c:
cd c:\dxwnd
start dxwnd.exe /R:0
cd c:\sega\vfpc && vfpc.exe && taskkill /F /IM dxwnd.exe
