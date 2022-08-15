# Beyond Good & Evil - GOG + WS + audio fix

### Description:
This script will facilitate install of this game on Linux OS:
"Beyond Good and Evil" provided by GOG using Wine and ps2wide widescreen patch http://ps2wide.net.
During install please let all options by default.
Thanks to the people who contributed to play this game in the best conditions on Linux.

### Technical notes:
- Widescreen patch
- Fix audio sync
- BGE Gog edition does not natively support controller, only Keyboard.  For a better gaming experience, you will find profiles for x360 and Steam Controller in the "gamepad profiles" folder
- Please report issue concerning this script on my Github page:
https://github.com/legluondunet/MyLittleLutrisScripts

# Beyond Good and Evil - Ubisoft Connect + WS + audio fix

### Description:
This script will facilitate install of this game on Linux OS:
"Beyond Good and Evil" provided by Ubisoft Connect using Wine and ps2wide widescreen patch http://ps2wide.net.
During install please let all options by default.
Thanks to the people who contributed to play this game in the best conditions on Linux.

### Technical notes:
- Widescreen patch
- Fix audio sync
- Please report issue concerning this script on my Github page:
https://github.com/legluondunet/MyLittleLutrisScripts

# Additional technical notes

#### SettingsApplication.exe not running 
Disable DXVK before launching

#### Audio is still too fast when using DXVK on high refreshrate monitor
Set the following system environment variable to limit in Lutris for the game:

`DXVK_FRAME_RATE=60`

#### Issue when installing on Steam Deck from Desktop mode:
- Crashes in Deck UI
- Launching in tall window in Desktop mode

Solution:

`bge.ini` needed for widescreen patch will have the screen Width and Height swapped, change it as follows:
```
[MAIN]
Width=1280
Height=800
```

#### Notes:
- Installing on Steam Deck from Desktop mode fetches the incorrect values because the default display orientation of the panel on the Steam Deck is in portrait mode - `800x1280`.
- Installing on Steam Deck through Deck UI correctly fetches the screen resolution. Rotation is applied in the session and the resulting values are as expected - `1280x800`.