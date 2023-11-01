#!/bin/bash

# Print commands and exit on errors
set -xe

export DEBIAN_FRONTEND=noninteractive

# Download hackathon page
cd /home/vagrant/
git clone https://github.com/IETF-Hackathon/pq-ech

# Copy benchmark files
cp /home/vagrant/pq-ech/src/benchmark.c /home/vagrant/share/wolfssl/wolfcrypt/benchmark/
cp /home/vagrant/pq-ech/src/benchmark.h /home/vagrant/share/wolfssl/wolfcrypt/benchmark/