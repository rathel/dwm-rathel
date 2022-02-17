#!/usr/bin/env bash

UPDATES=$(apt-get full-upgrade -s |grep -P '^\d+ upgraded'|cut -d" " -f1)

if [ "$UPDATES" -eq 0 ]; then
    echo ""
else
    echo "" "$UPDATES"
fi
