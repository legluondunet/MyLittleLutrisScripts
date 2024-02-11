@echo off
c:
cd GOG Games/Indiana Jones and the Emperor's Tomb/GameData/indy
copy /y vars.cfg.default vars.cfg
cd ../bin
start "" indy.exe
exit
