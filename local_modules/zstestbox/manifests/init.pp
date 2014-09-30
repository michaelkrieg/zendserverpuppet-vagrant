# == Class: zstestbox
#   Sanity checks and usage example for the Zend Server Puppet module
#
class zstestbox {
  class {'::zendserver': }

  #Get the mtrig sanity Zend Server app
  file {'/tmp/mtrig.zpk':
    ensure => present,
    source => "puppet:///modules/${module_name}/mtrig.zpk",
  }

  #Deploy the mtrig Zend Server sanity app
  zendserver::application { 'sanity':
    ensure        => 'deployed',
    app_package   => '/tmp/mtrig.zpk',
    require       => [Zendserver::Sdk::Target['localadmin'],
                      File['/tmp/mtrig.zpk']],
  }

  #Add the localadmin sdk target - get parameters from facter
  zendserver::sdk::target { 'localadmin':
    zskey     => $::zend_api_key_name,
    zssecret  => $::zend_api_key_hash,
  }

  #Configure the local firewall to allow access to Zend Server
  class { 'firewall': }

  firewall { '100 allow http, https and Zend Server console access':
    port    => [80, 443, 10081, 10082],
    proto   => tcp,
    action  => accept,
  }

  #Setup local mysql server to test Zend Server cluster
  include ::mysql::server

  file {'/root/.zsapi.ini':
    ensure => link,
    target => '/.zsapi.ini',
  }
}
