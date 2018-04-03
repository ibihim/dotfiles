#!/usr/bin/env bash

# creates lock that is the blurred workscreen

TMP_SCREENSHOT=/tmp/screenshot.png
TMP_SCREENSHOT_BLUR=/tmp/screenshotblur.png

# take screenshot
import -window root $TMP_SCREENSHOT

# blur it
convert $TMP_SCREENSHOT -blur 0x5 $TMP_SCREENSHOT_BLUR
[ $TMP_SCREENSHOT ] && rm $TMP_SCREENSHOT

# lock the screen
i3lock -i $TMP_SCREENSHOT_BLUR

exit 0

