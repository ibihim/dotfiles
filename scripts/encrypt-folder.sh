#!/usr/bin/env bash

# encrypts the given folder
sudo mount -t ecryptfs $1 $1

