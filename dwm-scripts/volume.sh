#!/bin/env bash

if [ "$(hostname)" == "debian-asusrog" ];then
    LEFT="$(pactl get-sink-volume 0 | awk '{print $5,$12}' | sed 's/%//g' | awk '{print $1}')"
    RIGHT="$(pactl get-sink-volume 0 | awk '{print $5,$12}' | sed 's/%//g' | awk '{print $2}')"
    MUTE="$(pactl get-sink-mute 0 | awk '{print $2}')"
else
    LEFT="$(pactl get-sink-volume 1 | awk '{print $5,$12}' | sed 's/%//g' | awk '{print $1}')"
    RIGHT="$(pactl get-sink-volume 1 | awk '{print $5,$12}' | sed 's/%//g' | awk '{print $2}')"
    MUTE="$(pactl get-sink-mute 1 | awk '{print $2}')"
fi

if [ "$MUTE" = "yes" ]; then
    echo "󰖁"
else
    if [ "$LEFT" = "$RIGHT" ]; then
        echo "󰕾 ""$LEFT""%"
    else
        echo "󰕾 ""$LEFT""%"/"󰕾 ""$RIGHT""%"
    fi
fi
