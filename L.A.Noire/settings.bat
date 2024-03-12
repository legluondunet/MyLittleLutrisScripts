@echo off
c:
cd "%USERPROFILE%\Documents\Rockstar Games\L.A. Noire"
dir

if exist "c:\Program Files (x86)\Steam\steamapps\common\L.A.Noire" (
echo le jeu est installé
attrib -r settings.ini
settings.ini
attrib +r settings.ini
) else (
echo le jeu n'est pas installé
attrib +r settings.ini
)
