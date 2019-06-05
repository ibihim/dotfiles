#!/usr/bin/env bash

########################################################################
#
# Sets the screen up for tripple, vertical monitors.
#
########################################################################

xrandr --output HDMI1 --mode 3840x2160 --above eDP1
feh --randomize --bg-fill ~/Pictures/wallpaper-horizontal

