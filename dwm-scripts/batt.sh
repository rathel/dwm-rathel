#!/usr/bin/env bash


STATUS=$(cat /sys/class/power_supply/BAT0/status)
BATT=$(cat /sys/class/power_supply/BAT0/capacity)

if [ "$STATUS" = "Discharging" ]; then
    if [ "$BATT" -lt 101 ]; then
        ICON="󰁹"
    fi
    if [ "$BATT" -lt 90 ]; then
        ICON="󰂂"
    fi
    if [ "$BATT" -lt 80 ]; then
        ICON="󰂁"
    fi
    if [ "$BATT" -lt 70 ]; then
        ICON="󰂀"
    fi
    if [ "$BATT" -lt 60 ]; then
        ICON="󰁿"
    fi
    if [ "$BATT" -lt 50 ]; then
        ICON="󰁾"
    fi
    if [ "$BATT" -lt 40 ]; then
        ICON="󰁽"
    fi
    if [ "$BATT" -lt 30 ]; then
        ICON="\e[32mRed󰁼"
    fi
    if [ "$BATT" -lt 20 ]; then
        ICON="󰁻"
    fi
    if [ "$BATT" -lt 10 ]; then
        ICON="󰁺"
    fi

else
    ICON="󰂄"
fi

echo -e "$ICON $BATT%"
