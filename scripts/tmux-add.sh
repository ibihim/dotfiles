#!/usr/bin/env bash
alias tmux='tmux -2 -f ~/.config/tmux/tmux.conf'

DIR_NAME=$(basename $PWD)
SESSION_EXISTS=$(tmux ls | grep $DIR_NAME)

echo SESSION_EXISTS: $SESSION_EXISTS
if [ "$SESSION_EXISTS" ]; then
    tmux a -t $DIR_NAME
else
    tmux new -s $DIR_NAME
fi
