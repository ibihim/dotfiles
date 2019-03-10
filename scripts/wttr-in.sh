#!/usr/bin/env bash

TIMER=3600

while true
do
    # prints the current / today's weather
    curl -s 'wttr.in/berlin?1pQn'
    sleep $TIMER
    clear
done

