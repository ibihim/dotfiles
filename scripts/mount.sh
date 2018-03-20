#!/usr/bin/env bash
sudo cryptsetup luksOpen /dev/sdc ssd
sudo mount /dev/mapper/ssd $HOME/.ssd

