#!/usr/bin/env bash

ENABLED="$(xinput list-props "ETPS/2 Elantech Touchpad" | awk '/Device Enabled/ {print $4}')"

if [ "$ENABLED" = 0 ]; then
    echo "󰍽"
else
    echo "󰍾"
fi
