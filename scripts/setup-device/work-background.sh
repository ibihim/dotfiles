#!/usr/bin/env bash

########################################################################
#
# Sets the screen up for tripple, vertical monitors.
#
########################################################################


#!/bin/sh
xrandr \
    --output eDP1 --primary --mode 1920x1080 --pos 640x1440 --rotate normal \
    --output DP2 --off \
    --output DP1 --mode 2560x1440 --pos 0x0 --rotate normal \
    --output HDMI1 --off
    --output VIRTUAL1 --off

feh --bg-fill ~/Pictures/wallpaper-horizontal/firewatch-wallpaper-1.jpg

