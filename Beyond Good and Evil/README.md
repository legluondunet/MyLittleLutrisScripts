files:
- gogsetup: N/A:Select the EXE downloaded from GOG
- wdpatch: https://github.com/legluondunet/MyLittleLutrisScripts/raw/master/Beyond%20Good%20and%20Evil/bge_widescreen.zip
- wrapper: https://github.com/legluondunet/MyLittleLutrisScripts/raw/master/Beyond%20Good%20and%20Evil/dsound.dll
game:
  exe: drive_c/GOG Games/Beyond Good and Evil/run.exe
  prefix: $GAMEDIR
installer:
- task:
    arch: win64
    install_gecko: true
    install_mono: false
    name: create_prefix
    prefix: $GAMEDIR
- task:
    description: Installing...
    executable: gogsetup
    name: wineexec
    prefix: $GAMEDIR
- extract:
    dst: $GAMEDIR/drive_c/GOG Games/Beyond Good and Evil
    src: wdpatch
- copy:
    dst: $GAMEDIR/drive_c/GOG Games/Beyond Good and Evil
    src: wrapper
- task:
    description: Please choose your desktop resolution, save and exit. If you your
      desktop resolution is not in the list, choose the closest one then activate
      Gamescope.
    executable: $GAMEDIR/drive_c/GOG Games/Beyond Good and Evil/SettingsApplication.exe
    name: wineexec
- write_config:
    data:
      MAIN:
        Height: $RESOLUTION_HEIGHT
        Width: $RESOLUTION_WIDTH
    file: $GAMEDIR/drive_c/GOG Games/Beyond Good and Evil/bge.ini
    merge: true
system:
  env:
    DXVK_FRAME_RATE: '60'
    DXVK_HUD: null
wine:
  overrides:
    dsound: native
