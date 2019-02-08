# Vagrantfile to setup a Ubuntu server with preinstalled packages
This Vagrantfile will provision a ubuntu server with preinstalled packages needed for our workshops.

## Prerequisites
1. Install [Oracle VM VirtualBox](https://www.virtualbox.org/wiki/Downloads)
1. Install [Vagrant](https://vagrantup.com/)

## Quick start
1. Clone this repository `git clone https://github.com/davidwackwitz1234/workshop-vm.git`
1. Change into the `workshop-vm` folder
1. Run `vagrant up` and wait for the first setup to finish
1. Run `vagrant ssh` to log into the machine
1. If the provision script changed use `vagrant provision` to apply it again
1. Have fun at the workshop!

## Synced folders

By default, Vagrant shares your project directory (remember, that is the one with the Vagrantfile) to the /vagrant directory in your guest machine.

```
vagrant@ubuntu-bionic:~$ ls /vagrant
README.md  Vagrantfile  bootstrap.sh  ubuntu-bionic-18.04-cloudimg-console.log
```

See also [Synced Folders](https://www.vagrantup.com/intro/getting-started/synced_folders.html) at Vagrant's documentation.