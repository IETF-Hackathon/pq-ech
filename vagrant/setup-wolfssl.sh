#!/bin/bash

# Print commands and exit on errors
set -xe

export DEBIAN_FRONTEND=noninteractive

# Create directory share if not exists
mkdir /home/vagrant/share -p

# Instal liboqs
cd /home/vagrant/share
mkdir oqs -p
cd oqs
git clone --single-branch https://github.com/open-quantum-safe/liboqs.git
cd liboqs/
git checkout 0.8.0
mkdir build -p
cd build
cmake -DOQS_USE_OPENSSL=0 -DBUILD_SHARED_LIBS=0 -DOQS_BUILD_ONLY_LIB=1 ..
make all -j`nproc`
sudo make install

#Install wolfssl with oqs
cd /home/vagrant/share
git clone https://github.com/wolfSSL/wolfssl.git --depth 10
cd wolfssl
./autogen.sh
./configure --enable-ech --enable-debug --disable-shared --disable-static --enable-kyber --disable-tlsv12 --disable-oldtls --with-liboqs
make -j`nproc`
# make check   # (optional, but highly recommended)
sudo make install

sudo chown -R vagrant:vagrant /home/vagrant/share
sudo chmod -R 777 /home/vagrant/share