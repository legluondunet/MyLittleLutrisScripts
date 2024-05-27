@echo on

c:

reg add "HKLM\SOftware\Classes\\CLSID\\{82D353DF-90BD-4382-8BC2-3F6192B76E34}\\InprocServer32" /ve /d "C:\\windows\\System32\\wmvdecod.dll" /f

reg add "HKLM\Software\\Classes\\CLSID\\{2EEB4ADF-4578-4D10-BCA7-BB955F56320A}\\InprocServer32" /ve /d "C:\\windows\\System32\\WMADMOD.DLL" /f

if exist "c:\Program Files (x86)\Steam" (
echo Version Steam

rem cd "c:\tmp"
rem copy /H /R /Y mfplat.dll "c:\windows\system32"
rem copy /H /R /Y mfplat.dll "c:\windows\syswow64"

cd "c:\Program Files (x86)\Steam"
start steam.exe
)

if exist "c:\GOG Games" (
echo Version GOG
cd "c:\GOG Games\Darksiders Warmastered Edition"
start darksiders1.exe steam://462780
)

exit
