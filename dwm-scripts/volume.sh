#!/bin/env bash

LEFT="$(pactl get-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo | awk '{print $5,$12}' | sed 's/%//g' | awk '{print $1}')"
RIGHT="$(pactl get-sink-volume alsa_output.pci-0000_00_1f.3.analog-stereo | awk '{print $5,$12}' | sed 's/%//g' | awk '{print $2}')"

if [ "$LEFT" = "$RIGHT" ]; then
    echo "墳 ""$LEFT""%"
else
    echo "墳 ""$LEFT""%"/"墳 ""$RIGHT""%"
fi
