#!/usr/bin/env bash

echo -n "none" | tee /sys/bus/serio/devices/serio1/drvctl
echo -n "reconnect" | tee /sys/bus/serio/devices/serio1/drvctl

