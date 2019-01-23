#!/usr/bin/env bash

###############################################
#
# copies password of given service into the
# clipboard
#
###############################################

[ -z "$1" ] && echo "usage: $0 \$SERVICE_NAME"

bw get password $1 | xsel -ib

