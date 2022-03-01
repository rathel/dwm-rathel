#!/bin/env bash

LEFT="$(pactl get-sink-volume 0 | awk '{print $5,$12}' | sed 's/%//g' | awk '{print $1}')"
RIGHT="$(pactl get-sink-volume 0 | awk '{print $5,$12}' | sed 's/%//g' | awk '{print $2}')"
MUTE="$(pactl get-sink-mute 0 | awk '{print $2}')"

if [ "$MUTE" = "yes" ]; then
    echo "ﱝ"
else
    if [ "$LEFT" = "$RIGHT" ]; then
        echo "墳 ""$LEFT""%"
    else
        echo "墳 ""$LEFT""%"/"墳 ""$RIGHT""%"
    fi
fi
