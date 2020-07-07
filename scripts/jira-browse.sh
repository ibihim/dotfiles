#!/usr/bin/env bash

xdg-settings set default-web-browser chrome.desktop
jira browse $1 &>/dev/null
xdg-settings set default-web-browser firefox.desktop

