#!/usr/bin/env bash

WORKINGDIR=$HOME/scripts/setup-device

source $WORKINGDIR/home-screen.sh
source $WORKINGDIR/work-mouse.sh

feh --bg-fill ~/Pictures/347106.jpg

killall -SIGUSR1 conky

