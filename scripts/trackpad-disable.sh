#!/usr/bin/env bash
xinput disable $(xinput list | grep Synaptics | awk '{ print $5 }' | sed 's/id=//')

