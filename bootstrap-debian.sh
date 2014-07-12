#!/bin/bash

apt-get update -qq
[ -x /usr/bin/git ] || apt-get install -y -q git
[ -x /opt/vagrant_ruby/bin/r10k ] || gem install --no-rdoc --no-ri r10k
egrep "zitrone2" /etc/hosts || echo "10.10.39.2 zitrone2.red-tag.de" >> /etc/hosts
egrep "zitrone2" /etc/ssh/ssh_config || echo -e "Host zitrone2.red-tag.de\n\tHostname 10.10.39.2\n\tStrictHostKeyChecking no\n\tPort 20022\n\tUser git" >> /etc/ssh/ssh_config

cd /vagrant && r10k -v info puppetfile install

