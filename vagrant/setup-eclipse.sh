#!/bin/bash

# Print commands and exit on errors
set -xe

export DEBIAN_FRONTEND=noninteractive

sudo apt-get install -y vanilla-gnome-desktop vanilla-gnome-default-settings 
sudo apt-get install -y default-jre
sudo apt-get install -y g++
cd /home/vagrant
wget https://ftp.fau.de/eclipse/technology/epp/downloads/release/2023-09/R/eclipse-cpp-2023-09-R-linux-gtk-x86_64.tar.gz
tar --warning=no-unknown-keyword -xvzf ./eclipse-cpp-2023-09-R-linux-gtk-x86_64.tar.gz
sudo chown -R vagrant:vagrant /home/vagrant/eclipse
sudo chmod -R 777 /home/vagrant/eclipse
