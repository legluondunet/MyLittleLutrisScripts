#!/bin/bash

cd drive_c/HODCD
if [ -f HeartOfDarkness_Fr.EXE ]; then 
cp HeartOfDarkness_Fr.EXE HeartOfDarkness.EXE
elif [ -f HeartOfDarkness_Ge.EXE ]; then 
cp HeartOfDarkness_Ge.EXE HeartOfDarkness.EXE
elif [ -f HeartOfDarkness_En.EXE ]; then 
cp HeartOfDarkness_En.EXE HeartOfDarkness.EXE
fi
