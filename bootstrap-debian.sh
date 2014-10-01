#!/bin/bash

if [ ! -f /etc/apt/sources.list.d/puppetlabs.list ] ; then
  ## first, remove old puppet packages to avoid conflicts:
  apt-get purge puppet puppet-common -qq

  ## then, pull the puppetlabs APT repo and install Puppet from there:
  RELEASE=$(lsb_release -sc)
  pushd /tmp 1>/dev/null
  wget --quiet https://apt.puppetlabs.com/puppetlabs-release-${RELEASE}.deb && \
  sudo dpkg -i puppetlabs-release-${RELEASE}.deb
  popd 1>/dev/null
fi

apt-get update -qq && apt-get autoremove -qq
apt-get install -y -q puppet
[ -x /usr/bin/git ] || apt-get install -y -q git
[ -x /opt/vagrant_ruby/bin/r10k ] || gem install --no-rdoc --no-ri r10k

cd /vagrant && r10k -v info puppetfile install

#Dirty hack to support facter older than version 2.0.1
mkdir -p /etc/facter/facts.d
cp -a /vagrant/modules/zendserver/facts.d/* /etc/facter/facts.d
