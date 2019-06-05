#!/usr/bin/env bash

#################################################
#
# Sets a lockscreen for tripple monitors.
#
#################################################

LOCK_PIC=$HOME/Pictures/lockscreen.png
LAPTOP_PIC=$HOME/Pictures/lockscreen-laptop.png

[ $LOCK_PIC ] && [ -f $LOCK_PIC ] && rm $LOCK_PIC

ln -s $LAPTOP_PIC $LOCK_PIC

