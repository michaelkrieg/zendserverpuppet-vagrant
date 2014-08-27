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

Copy Vagrantfile.dist to Vagrantfile and Puppetfile.dist to Puppetfile 

and then run:

    vagrant up <boxname> ## e.g.: debianbox

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


