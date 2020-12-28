echo off

if exist "c:\Program Files (x86)\Ubisoft\Ubisoft Game Launcher\games\Beyond Good and Evil\SettingsApplication.exe" (
   echo SettingsApplication.exe exists
   "c:\Program Files (x86)\Ubisoft\Ubisoft Game Launcher\games\Beyond Good and Evil\SettingsApplication.exe"
) else (
    echo SettingsApplication.exe does not exist
    "c:\Program Files (x86)\Ubisoft\Ubisoft Game Launcher\UbisoftConnect.exe" uplay://launch/232/0
)

