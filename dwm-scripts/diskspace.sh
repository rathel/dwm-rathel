#!/usr/bin/env bash

TOTAL="$(df -h 2>/dev/null | awk '/\/$/ {print $2}')"
USED="$(df -h 2>/dev/null | awk '/\/$/ {print $3}')"
RES="$?"

if test "$RES" != "0";then
    echo ""
else
    echo "" "$USED""/""$TOTAL"
fi
