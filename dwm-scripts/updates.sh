#!/usr/bin/env bash

UPDATES=$(apt-get full-upgrade -s |grep -P '^\d+ upgraded'|cut -d" " -f1)
#UPDATES=$(pacman -Qu | wc -l)

if [ "$UPDATES" -eq 0 ]; then
    echo ""
else
    echo "󰏕" "$UPDATES"
fi
