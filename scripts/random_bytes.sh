#!/usr/bin/env zsh
INPUT=$1
BYTES_TO_READ=${INPUT:-32}
dd if=/dev/random bs=$BYTES_TO_READ count=1 2>/dev/null| base64 | tee >(xsel -ib)
