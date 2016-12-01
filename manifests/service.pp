# Class: dnsdist::service
#
# This class manages the dnsdist service

class dnsdist::service (
  $enabled = true,
  $ensure  = true
){
  service { 'dnsdist':
    ensure     => $ensure,
    enable     => $enabled,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['dnsdist::config']
  }
}
