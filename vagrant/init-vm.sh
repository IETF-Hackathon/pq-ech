#!/bin/bash

# Print commands and exit on errors
set -xe

export DEBIAN_FRONTEND=noninteractive

apt-get update -q
apt-get dist-upgrade -y
sudo apt-get install -y make git gcc libmnl-dev autoconf automake libtool cmake