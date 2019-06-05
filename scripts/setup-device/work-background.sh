#!/usr/bin/env bash

########################################################################
#
# Sets the screen up for tripple, vertical monitors.
#
########################################################################

xrandr --output HDMI1 --auto --rotate left --left-of eDP1 --output DP2 --auto --rotate left --left-of HDMI1
feh --randomize --bg-fill ~/Pictures/vertical

