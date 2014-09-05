class zstestbox {
  class {'::zendserver': }
  file {'/tmp/mtrig.zpk':
    ensure => present,
    source => "puppet:///modules/${module_name}/mtrig.zpk",
  }

  zendserver::application { 'sanity':
    ensure      => 'deployed',
    app_package => '/tmp/mtrig.zpk',
    require       => [Zendserver::Sdk::Target['localadmin'],File['/tmp/mtrig.zpk']],
  }

  zendserver::sdk::target { 'localadmin':
    zskey => $::zend_api_key_name,
    zssecret => $::zend_api_key_hash,
  }

  file {'/root/.zsapi.ini':
    ensure => link,
    target => '/.zsapi.ini',
  }
}
