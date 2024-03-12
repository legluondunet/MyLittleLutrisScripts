@echo off
c:
cd "%USERPROFILE%\Documents\Rockstar Games\L.A. Noire"
dir

if exist "c:\Program Files (x86)\Steam\steamapps\common\L.A.Noire" (
attrib -r settings.ini
settings.ini
attrib +r settings.ini
) else (
attrib +r settings.ini
)
