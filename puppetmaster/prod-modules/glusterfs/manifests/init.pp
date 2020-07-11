# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include glusterfs
class glusterfs {

  package { 'centos-release-gluster':
    ensure => 'installed',
  }

  package { 'glusterfs-server':
    ensure => 'installed',
    require => Package['centos-release-gluster'],
  }

  service { 'glusterd':
    ensure => 'running',
    enable => true,
    require => Package['glusterfs-server'],
  }

}
