# Genshin Impact

### Description:
Play Genshin Impact on Linux.

### Technical notes:
- This script uses a patch which is not supported by MiHoYo, USE IT AT YOUR OWN RISK.
- You will need root rights to install this patch as it will modify /etc/hosts system file.
- Patch is not applied by default. To apply or revert it, right click on the game icon/banner and select "execute script" --> https://imgur.com/D4jDdPX
- This script installer needs xdelta3, xterm, zenity binaries.
- If install freeze during download, kill "launcher.exe" process. Then launch the game from Lutris and choose option 2 in menu "Update Genshin Impact".  Once downloading and installing completed, close the game, patch the game, start the game and choose option 1 in menu.


### Manual Installation:

- Unzip gi_patch_(version).zip into your wine c: drive (default is '~/.wine/drive_c')
- Your c drive should now have a gi_patch folder next to program files, users, windows ect.
- Now run gi_patch.sh and patch game (in terminal type './gi_patch.sh')
- Last run gi_menu.bat with wine and type 1
- Game should open
- If you want to create a desktop shortcut simply copy the path to where you downloaded gi_menu.bat and use the command 'wine gi_menu.bat'
