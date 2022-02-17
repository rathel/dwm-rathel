#!/usr/bin/env bash

TOTAL="$(df -h | awk '/\/$/ {print $2}')"
USED="$(df -h | awk '/\/$/ {print $3}')"

echo "" "$USED""/""$TOTAL"
