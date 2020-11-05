# Twitch App

### Description:
This script will facilitate you install of this application on Linux OS: "Twitch App" provided by https://www.twitch.tv/. During install please let all options by default. Big thanks to people who gave their time to permit us using this application in the best conditions on Linux platform.

### Technical notes:
- This script will automatically download the latest official Twitch App version.
- Known issue: if Dotnet 4.8 never ending install, open a terminal and execute this command:
killall -9 explorer.exe services.exe plugplay.exe mscorsvw.exe winedevice.exe regedit.exe
Then you can still reinstall it later using Winetricks.
