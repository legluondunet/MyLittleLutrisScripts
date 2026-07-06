#!/bin/bash

while true; do
    # fenêtre active actuelle
    active=$(xdotool getactivewindow 2>/dev/null)

    # une des fenêtres "LEGO Company"
    target=$(xdotool search --name "LEGO Company" 2>/dev/null | head -n 1)

    # si on a une fenêtre cible et qu'elle est active -> stop
    if [[ -n "$target" && "$active" == "$target" ]]; then
        break
    fi

    # sinon on force le focus
    xdotool search --name "LEGO Company" windowactivate 2>/dev/null

    # pause
    sleep 5
done
