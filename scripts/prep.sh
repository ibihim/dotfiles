#!/usr/bin/env bash

###########################
#
# ps aux | grep, like a pro
#
###########################

[ -z $1 ] && echo "use: $0 \$PROCESS_NAME"

ps aux | grep $1 | grep -v grep | grep $1

