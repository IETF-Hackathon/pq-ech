# IETF118-PQ-ECH
Material for the IETF 118 poject Post-quantum Encrypted Client Hello (PQ-ECH). Find more information in the [documentation](documentation/) folder.


## Vagrant


We are using Vagrant to create an isolated environment for wolfSSL code development during the Hackathon. Below you can find prerequisites and instruction on how to use Vagrant and develop wolfSSL code.


## Prerequisites

To be able to use the vagrant files you will need to install Vagrant and Virtualbox:

### Vagrant

#### Linux

For Linux users, simply install Vagrant from the apt-repositories
```
sudo apt install vagrant
```
#### Windows

For Windows users, you need to download and install Vagrant from the [Vagrant Download Page](https://developer.hashicorp.com/vagrant/downloads)

### Vagrant plugin

You need to install the reload plugin. From a CLI (terminal or command prompt) type:

```
vagrant plugin install vagrant-reload
```

### VirtualBox

Vagrant requires a provisioner, e.g VirtualBox, Hyper-V etc. Our scripts use VirtualBox. 

#### Linux 

In Linunx you can easily install it from your distribution's repository:

```
sudo apt install virtualbox
```

#### Windows

For Windows users, you need to download and install VirtualBox from the [VirtualBox Download page](https://www.virtualbox.org/wiki/Downloads)

## Setup

Now you are ready to use Vagrant to create an isolated environment for developing the wolfSSL code. 

Clone (or download) this repository:

```
git clone https://github.com/IETF-Hackathon/pq-ech.git
```

There are currently two flavors:

### Flavor with Desktop GUI: 

To create a complete environment with the Eclipse IDE ready to debug wolfSSL code simply run:

```
cd pq-ech/vagrant
vagrant up
```

Build time is around 20-40 minutes depending on your download speed and your system configuration

### Lightweight flavor with CLI: 

To create just an isolated environment without GUI and with a shared folder that you can edit from your host machine simply run:

```
cd pq-ech/vagrant
vagrant up cli
```

Build time is around 10-20 minutes depending on your download speed and your system configuration

## Post-setup instructions

### Flavor with Desktop GUI: 

1) Open the Virtual Box GUI application
2) Open the newly created Virtual Machine with everything that you need already installed.


### Lightweight flavor with CLI: 

Simply run:

```
vagrant ssh
```

The password is `vagrant`.
