#!/usr/bin/env bash

ESSID="$(iwconfig wlan0 | awk '/ESSID/ {print $4,$NF}' | sed -e 's/ESSID://g' -e 's/\"//g')"
STRENGTH="$(iwconfig wlan0 | awk '/Link/ {print $2}' | cut -b 9-)"
LEVEL="$(iwconfig wlan0 | awk '/Link/ {print $4}' | cut -b 7-)"


echo "直" "$ESSID" "$STRENGTH" "$LEVEL dBm"
