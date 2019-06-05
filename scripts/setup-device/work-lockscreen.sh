#!/usr/bin/env bash

#################################################
#
# Sets a lockscreen for tripple monitors.
#
#################################################

LOCK_PIC=$HOME/Pictures/lockscreen.png
TRIPPLE_PIC=$HOME/Pictures/tripple-lockscreen.png

[ $LOCK_PIC ] && rm $LOCK_PIC

ln -s $TRIPPLE_PIC $LOCK_PIC

