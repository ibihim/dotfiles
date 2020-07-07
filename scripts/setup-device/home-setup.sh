#!/usr/bin/env bash

WORKINGDIR=$HOME/scripts/setup-device

source $WORKINGDIR/home-screen.sh
source $WORKINGDIR/work-mouse.sh

killall -SIGUSR1 conky

