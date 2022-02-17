#!/usr/bin/env bash

while true; do
    xsetroot -name "$(/home/rathel/.local/share/dwm/weather.sh)" "|" "$(/home/rathel/.local/share/dwm/batt.sh)"
    sleep 10
done &
