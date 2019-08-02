#!/usr/bin/env bash

XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
TMUXP_CONFIG=$XDG_CONFIG_HOME/tmuxp
WORKSPACE_CONFIG=$1

tmuxp load $(find $TMUXP_CONFIG -name "*$WORKSPACE_CONFIG*")
