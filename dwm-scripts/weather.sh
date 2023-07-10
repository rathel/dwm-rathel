#!/usr/bin/env bash


WEATHER="$(curl "wttr.in/Elizabeth+Colorado?format=%C%20%t&u")"
RES=$?
UNKNOWN="$WEATHER | cut -d' ' -f1"

if test "$RES" != "0";then
    echo "N/A"
elif test "$UNKNOWN" = "Unknown ";then
    echo "N/A"
else
    echo "$WEATHER"
fi
