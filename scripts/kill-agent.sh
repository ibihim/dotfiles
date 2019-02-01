#!/usr/bin/env bash

############################################
#
# Sometimes unreliable gpg agent managing keys
# wants to be killed and resourcected.
#
############################################

kill $(ps aux | grep gpg | grep agent | grep -v grep | awk '{ print $2 }')
source ~/.zshrc

