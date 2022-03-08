#!/usr/bin/env bash

xrdb -merge ~/.Xresources &
dwmblocks &
#/home/rathel/.local/share/dwm/statusbar.sh &
wal -R &
/home/rathel/firefox-beta/firefox &
kitty &
numlockx &
#compton &
#nm-applet &
emacsclient -c -a emacs &
#blueman-applet &
xinput disable "ETPS/2 Elantech Touchpad" &
#steam_chat &
#gmail &
redshift &
xautolock -locker slock &
/usr/lib/x86_64-linux-gnu/libexec/polkit-kde-authentication-agent-1 &
~/.local/bin/Ferdi &
#bluetoothctl power on &
pulseaudio &
