#!/usr/bin/env bash

sudo add-apt-repository ppa:wireguard/wireguard
sudo apt update -y && sudo apt install -y wireguard-dkms wireguard-tools

# install kernel header files
sudo apt-get install linux-headers-$(uname -r)

# add forwarding net.ipv4.ip_forward=1
# add forwarding net.ipv6.conf.all.forwarding = 1
sudo vim /etc/sysctl.d/99-sysctl.conf

# set up file and empty conf
(umask 077 && printf "[Interface]\nPrivateKey = " | sudo tee /etc/wireguard/wg0.conf > /dev/null)

# create key pair
wg genkey | sudo tee -a /etc/wireguard/wg0.conf | wg pubkey | sudo tee /etc/wireguard/publickey

# edit config file
sudo vim /etc/wireguard/wg0.conf

