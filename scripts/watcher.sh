#!/usr/bin/env bash

if command -v entr > /dev/null
then
    find . -print | grep -i '.*[.]go' | \
    entr -c go test ./...
else
    go test ./...
    echo "\nInstall entr(1) to \"echo \"run tasks when files change. \nSee http://entrproject.org/"
fi

