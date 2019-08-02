#!/usr/bin/env bash

############################
#
# Custom pomodoro timings,
# accoring do research. Done
# by playing music.
#
# Deps: mp3info, mpg123
#
############################

WORK_FILE=$1
PAUSE_FILE=$2

WORK_TIME="55m"
PAUSE_TIME="15m"

while getopts qf:
do
    case "${option}"
        in
        q) ;;
        f) MUSIC_FILE=${OPTARG};;
    esac
done

TEST="1m"
timeout $TEST mpg123 --loop -1 -v $WORK_FILE

