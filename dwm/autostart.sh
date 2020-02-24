#!/bin/sh

nm-applet &
blueman-applet &
dunst &
hsetroot -solid '#000000'
compton --config ~/.config/compton/compton.conf &
# feh --bg-scale ~/Pictures/Wallpapers/active.jpg &
feh --bg-fill ~/Pictures/Wallpapers/active.jpg &
xautolock -time 10 -notify 50 -locker 'i3lock -d -c 000000' &
slstatus 2>&1 > /dev/null &
