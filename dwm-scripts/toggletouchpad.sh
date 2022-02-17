#!/usr/bin/env bash

DEVICE="ETPS/2 Elantech Touchpad"
ENABLED="$(xinput list-props "ETPS/2 Elantech Touchpad" | awk '/Device Enabled/ {print $4}')"

if [ "$ENABLED" = 0 ]; then
    xinput enable "$DEVICE"
else
    xinput disable "$DEVICE"
fi
