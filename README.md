Vagrant based testboxes for Zend Server Puppet module
=====================================================

Requirements
------------

    - Vagrant >= 1.6
    - VirtualBox

Enable ssh agent forwarding and add your key to access the private GIT(lab) repository at zitrone2.red-tag.de:

    ssh-add <path-to-your-key>


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



A list of boxes:

    vagrant status

Boxes
-----

| Box       | OS variant       | main IP       |
|-----------|------------------|---------------|
| debianbox | Debian "Wheezy"  | 172.21.7.90   |
| trustybox | Ubuntu 14.04 LTS | 172.21.7.91   |

Requirements
------------

Enable ssh agent forwarding and add your key to access the private GIT(lab) repository at zitrone2.red-tag.de:

    ssh-add <path-to-your-key>


