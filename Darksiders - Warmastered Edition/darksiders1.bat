@echo off

c:

reg add "HKLM\SOftware\Classes\\CLSID\\{82D353DF-90BD-4382-8BC2-3F6192B76E34}\\InprocServer32" /ve /d "C:\\windows\\System32\\wmvdecod.dll" /f

reg add "HKLM\Software\\Classes\\CLSID\\{2EEB4ADF-4578-4D10-BCA7-BB955F56320A}\\InprocServer32" /ve /d "C:\\windows\\System32\\WMADMOD.DLL" /f

start darksiders1.exe

exit
