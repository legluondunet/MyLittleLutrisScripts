#!/bin/sh

rom_file=$(find * -type f -name "*.n64")
./doom64ex -wadgen "$rom_file">doom64ex.log
mv "$HOME/.local/share/doom64ex/"* .

