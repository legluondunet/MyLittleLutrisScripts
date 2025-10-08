@echo on

c:
DEL /F /Q c:\windows\system32\mfplat.dll
COPY /Y  c:\tmp\mfplat.dll c:\windows\system32
rem copy /H /R /Y c:\tmp\mfplat.dll c:\windows\system32

reg add "HKLM\SOftware\Classes\\CLSID\\{82D353DF-90BD-4382-8BC2-3F6192B76E34}\\InprocServer32" /ve /d "C:\\windows\\System32\\wmvdecod.dll" /f

reg add "HKLM\Software\\Classes\\CLSID\\{2EEB4ADF-4578-4D10-BCA7-BB955F56320A}\\InprocServer32" /ve /d "C:\\windows\\System32\\WMADMOD.DLL" /f

if exist "c:\Program Files (x86)\Steam" (
echo Version Steam

cd "c:\Program Files (x86)\Steam"
start steam.exe -cef-disable-gpu-compositing -applaunch 462780
)

if exist "c:\GOG Games" (
echo Version GOG
cd "c:\GOG Games\Darksiders Warmastered Edition"
start darksiders1.exe 
)

exit
