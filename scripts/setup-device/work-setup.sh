#!/usr/bin/env bash

WORKINGDIR=$HOME/scripts/setup-device

source $WORKINGDIR/work-background.sh
source $WORKINGDIR/work-mouse.sh
source $WORKINGDIR/work-lockscreen.sh

killall -SIGUSR1 conky

