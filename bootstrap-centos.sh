#!/bin/bash

#Obtain puppet from puppetlabs
sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum install puppet -y

#sudo yum install -y puppet

[ -x /usr/bin/git ] || yum install -y -q git
[ -x /opt/vagrant_ruby/bin/r10k ] || gem install --no-rdoc --no-ri r10k

cd /vagrant && r10k -v info puppetfile install

#Dirty hack to support facter older than version 2.0.1
mkdir -p /etc/facter/facts.d
cp -a /vagrant/modules/zendserver/facts.d/* /etc/facter/facts.d
