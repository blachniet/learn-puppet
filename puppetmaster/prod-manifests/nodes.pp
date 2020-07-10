node 'puppetnode.localdomain' {
  class { 'linux': }
}

class linux {
  file { '/info.txt':
    ensure => present,
    content => inline_template("Created by Puppet at <%= Time.now %>\n"),
  }

  package { 'ntp':
    ensure => installed,
  }

  service { 'ntpd':
    ensure => running,
    enable => true,
  }
}
