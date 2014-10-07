#!/bin/bash

#Obtain puppet from puppetlabs
sudo rpm -ivh http://yum.puppetlabs.com/puppetlabs-release-el-6.noarch.rpm
yum install puppet hiera -y

#sudo yum install -y puppet

[ -x /usr/bin/git ] || yum install -y -q git

gem list system_timer -i 1>/dev/null || gem install --no-rdoc --no-ri system_timer
gem list r10k -i 1>/dev/null || gem install --no-rdoc --no-ri r10k

cd /vagrant && r10k -v info puppetfile install

#Dirty hack to support facter older than version 2.0.1
mkdir -p /etc/facter/facts.d
cp -a /vagrant/modules/zendserver/facts.d/* /etc/facter/facts.d
