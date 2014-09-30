Vagrant based testboxes for Zend Server Puppet module
=====================================================

This Vagrant script will setup a box with:
 - Zend Server - currently joins a cluster and installs the sanity zpk
 - Mysql


Requirements
------------

    - Vagrant >= 1.6
    - VirtualBox
    - An internet connection


Getting started
---------------

1. Clone this repository into a directory on your computer.
2. cd (change directory) into that directory. 
3. Copy Vagrantfile.dist to Vagrantfile
4. Copy Puppetfile.dist to Puppetfile 
5. Edit data/common.yml and enter the required Zend Server parameters
6. In puppet Puppetfile please set the correct git repo from which to pull the module:

    | Repository Name   | Git URL|
    |-------------------|--------|
    | Bleeding edge - (Please use this repo for now) | https://github.com/davidl-zend/ZendServerPuppet.git |
    | Relatively stabe | https://github.com/zend-patterns/ZendServerPuppet.git|

7. Start the environment:

    vagrant up <boxname> ## e.g.: trustybox


# More options
Get A list of boxes:

    vagrant status

SSH into a box (for troubeshooting)

    vagrant ssh
    
Reboot a box
    
    vagrant reload
    
Re-run puppet on a box
    
    vagrant reload --provision

Boxes
-----

| Box         | OS variant       | main IP       |
|-------------|------------------|---------------|
| debianbox   | Debian "Wheezy"  | 172.21.7.90   |
| trustybox   | Ubuntu 14.04 LTS | 172.21.7.91   |
| centos64box | CentOS 6.4       | 172.21.7.92   |

Requirements
------------

Enable ssh agent forwarding and add your key to access the repository from inside your Vagrant box:

    ssh-add <path-to-your-key>


