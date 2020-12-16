#!/usr/bin/env bash

# creates lock that is the blurred workscreen

TMP_SCREENSHOT=/tmp/screenshot.png
TMP_SCREENSHOT_BLUR=/tmp/screenshotblur.png

if [ ! -f $TMP_SCREENSHOT_BLUR ]; then
    # take screenshot
    import -window root $TMP_SCREENSHOT

    # blur it
    convert $TMP_SCREENSHOT -blur 0x5 $TMP_SCREENSHOT_BLUR
    [ $TMP_SCREENSHOT ] && rm $TMP_SCREENSHOT
fi

# lock the screen with monitor off
swayidle -w \
    timeout 10 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' \
swaylock -e -f -i $TMP_SCREENSHOT_BLUR

exit 0

