#!/usr/bin/env bash

# lock the screen with monitor off
swayidle -w \
    timeout 10 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"'

swaylock -e -f -c 000000

exit 0

