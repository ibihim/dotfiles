#!/usr/bin/env bash

LAYOUT=$(setxkbmap -query | grep layout | awk '{print $2}')

if [ $LAYOUT == "us" ]
then
    printf "layout us, set de\n"
    setxkbmap de
else
    printf "layout de, set en\n"
    setxkbmap us
fi

