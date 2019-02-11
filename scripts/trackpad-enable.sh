#!/usr/bin/env bash
xinput enable $(xinput list | grep Synaptics | awk '{ print $5 }' | sed 's/id=//')

