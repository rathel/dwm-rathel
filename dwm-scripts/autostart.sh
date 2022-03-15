#!/usr/bin/env bash
# SPDX-License-Identifier: MIT

## Copyright (C) 2009 Przemyslaw Pawelczyk <przemoc@gmail.com>
##
## This script is licensed under the terms of the MIT license.
## https://opensource.org/licenses/MIT
#
# Lockable script boilerplate

### HEADER ###

LOCKFILE="/var/lock/`basename $0`"
LOCKFD=99

# PRIVATE
_lock()             { flock -$1 $LOCKFD; }
_no_more_locking()  { _lock u; _lock xn && rm -f $LOCKFILE; }
_prepare_locking()  { eval "exec $LOCKFD>\"$LOCKFILE\""; trap _no_more_locking EXIT; }

# ON START
_prepare_locking

# PUBLIC
exlock_now()        { _lock xn; }  # obtain an exclusive lock immediately or fail
exlock()            { _lock x; }   # obtain an exclusive lock
shlock()            { _lock s; }   # obtain a shared lock
unlock()            { _lock u; }   # drop a lock

### BEGIN OF SCRIPT ###

xrdb -merge ~/.Xresources &
dwmblocks &
#/home/rathel/.local/share/dwm/statusbar.sh &
wal -R &
firefox-developer-edition &
#kitty &
st
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
/usr/lib/polkit-kde-authentication-agent-1 &
$HOME/.local/bin/Ferdi &
#bluetoothctl power on &
pulseaudio &

# Simplest example is avoiding running multiple instances of script.
exlock_now || exit 1
