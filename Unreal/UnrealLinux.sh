#!/bin/sh
cd System
MESA_EXTENSION_MAX_YEAR=1999
#LD_LIBRARY_PATH=../lin_convenience_libs
#export LD_LIBRARY_PATH
LD_LIBRARY_PATH=../libs ./UnrealLinux.bin -log
