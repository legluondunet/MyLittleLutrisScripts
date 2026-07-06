#!/bin/bash

while ! xdotool search --name "LEGO Company" >/dev/null 2>&1; do
    sleep 3
done

xdotool search --name "LEGO Company" windowactivate
sleep 1
xdotool search --name "LEGO Company" windowactivate
