# Twitch App

### Description:
This script will facilitate you install of this application on Linux OS: "Twitch App" provided by https://www.twitch.tv/. 
During install please let all options by default. 
Big thanks to people who gave their time to permit us using this application in the best conditions on Linux platform.

### Technical notes:
- This script will install:
-- latest official Twitch Appversion
-- Install Dotnet 4.8 necessary to activate some extra Twich App features
- Known issue: 
if Dotnet 4.8 never ending install, open a terminal and execute this command:
killall -9 explorer.exe services.exe plugplay.exe mscorsvw.exe winedevice.exe regedit.exe
then execute this another command:
ps aux |grep .exe
to see if some wine processes are still active and kill them too.
You can still reinstall Dotnet 4.8 later using Winetricks inside Lutris.

