#!/usr/bin/env bash

speedtest-cli --simple --single > "$HOME/.local/share/dwm/bandwidth.txt"
DOWNLOAD=$(grep "Download" "$HOME/.local/share/dwm/bandwidth.txt" | awk '{print $2,$3}')
UPLOAD=$(grep "Upload" "$HOME/.local/share/dwm/bandwidth.txt" | awk '{print $2,$3}')

echo "$DOWNLOAD" "$UPLOAD"
