#!/usr/bin/env bash

MEMORY="$(free -h | awk '/^Mem/ { print $3\"/\"$2 }' | sed s/i//g)"
RES="$?"

if test "$RES" != "0";then
    echo ""
else
    echo "󰍛" "$MEMORY"
fi
