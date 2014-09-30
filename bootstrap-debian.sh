#!/bin/bash

#Get latest puppet version on Debian since it comes with an incompatible version
if [ -f /etc/debian_version ] ; then
  DistroBasedOn='Debian'
  DIST=`cat /etc/lsb-release | grep '^DISTRIB_ID' | awk -F=  '{ print $2 }'`
  PSUEDONAME=`cat /etc/lsb-release | grep '^DISTRIB_CODENAME' | awk -F=  '{ print $2 }'`
  REV=`cat /etc/lsb-release | grep '^DISTRIB_RELEASE' | awk -F=  '{ print $2 }'`
  pushd /tmp
  wget https://apt.puppetlabs.com/puppetlabs-release-precise.deb && \
  sudo dpkg -i puppetlabs-release-precise.deb
  popd
fi

apt-get update -qq
apt-get install -y -q puppet
[ -x /usr/bin/git ] || apt-get install -y -q git
[ -x /opt/vagrant_ruby/bin/r10k ] || gem install --no-rdoc --no-ri r10k

cd /vagrant && r10k -v info puppetfile install

#Dirty hack to support facter older than version 2.0.1
mkdir -p /etc/facter/facts.d
cp -a /vagrant/modules/zendserver/facts.d/* /etc/facter/facts.d
