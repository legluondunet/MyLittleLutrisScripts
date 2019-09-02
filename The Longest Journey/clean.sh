#!/bin/bash
cd drive_c
mkdir "GOG Games"
mv "The Longest Journey" "GOG Games"
cd "GOG Games/The Longest Journey"
rm -f -r app commonappdata __redist station_fix tmp gog* *.dll TLJRegFix.* dxsetup.ini
cd ../../ResidualVM/
mv app/* .
rm -f -r app userappdata
