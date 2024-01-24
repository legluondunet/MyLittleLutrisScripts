@echo off

c:

IF EXIST "c:\Program Files (x86)\Steam\steamapps\common\Beyond Good and Evil\BGE.exe" (
  ECHO echo "le jeu BGE est installé"
  "c:\Program Files (x86)\Steam\steam.exe" -applaunch 15130
) ELSE (
  ECHO "le jeu BGE n'est pas installé"
  "c:\Program Files (x86)\Steam\steam.exe" "steam://install/15130"
  "c:\Program Files (x86)\Steam\steamapps\common\Beyond Good and Evil\SettingsApplication.exe"
)
