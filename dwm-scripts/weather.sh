#!/usr/bin/env bash


WEATHER="$(curl "wttr.in/Elizabeth,Co?format=%C%20%t&u")"
echo "$WEATHER"
