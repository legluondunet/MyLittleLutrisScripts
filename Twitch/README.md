# Twitch App

### Description:
This script will facilitate "Twitch App" install on Linux OS.
During install, please let all options by default.
Thanks to the people who helped us play this game in the best conditions on Linux platform.

### Technical notes:
- This script will automatically download the latest official Twitch App version.
- Known issue: if Dotnet 4.8 never ending install, open a terminal and execute this command:
killall -9 explorer.exe services.exe plugplay.exe mscorsvw.exe winedevice.exe regedit.exe
Then you can still reinstall it later using Winetricks.
