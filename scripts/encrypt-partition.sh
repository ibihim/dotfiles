#!/usr/bin/env bash

# encrypts an entire partition ext4 with luksFormat
# partition is parsed in as argument, e.g. /dev/sdd1
# crypt attributes:
#  - hash sha512
#  - cipher aes-xts-plain64
#  - key-size 512

DEVICE_NAME=crypt-usb

# Convert partition to LUKS format
sudo cryptsetup --verbose --cipher aes-xts-plain64 --key-size 512 --hash sha512 --iter-time 4000 --use-random luksFormat $1

# Map partition to device name
sudo cryptsetup luksOpen $1 $DEVICE_NAME

# Partition to ext4
sudo mkfs.ext4 /dev/mapper/$DEVICE_NAME

# Mount partition
sudo mount /dev/mapper/$DEVICE_NAME /mnt

echo partition mounted to /mnt

