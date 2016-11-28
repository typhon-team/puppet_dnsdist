# Class: dnsdist::service
#
# This class manages the dnsdist service

class dnsdist::service {
  service { 'dnsdist':
    ensure     => running,
    enable     => true,
    hasstatus  => true,
    hasrestart => true,
    require    => Class['dnsdist::config']
  }
}
