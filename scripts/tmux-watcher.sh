#!/usr/bin/env bash

SESSION_NAME=$1

tmux new-session -t $1 -s ${SESSION_NAME}_watcher

