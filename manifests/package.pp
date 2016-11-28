# Class: dnsdist::package
#
# This class installs dnsdist
# Parameters:
#   $distribution
#
# Requires:
#   apt
#
# Sample Usage:
#
#   class { '::dnsdist::package':
#    distribution => 'debian',
#  }
#

class dnsdist::package ($distribution = 'ubuntu'){

  apt::pin { 'dnsdist':
    origin   => 'repo.powerdns.com',
    priority => '600'
  }

  apt::key { 'powerdns':
    key         => 'FD380FBB',
    key_content => template('dnsdist/aptkey.erb'),
  }

  case $distribution {
    'ubuntu': {
      apt::source { 'repo.powerdns.com':
        location    => 'http://repo.powerdns.com/ubuntu',
        repos       => 'main',
        release     => 'trusty-dnsdist-10',
        include_src => false,
        amd64_only  => true,
        require     => [Apt::Pin['dnsdist'], Apt::Key['powerdns']]
      }
    }
    'debian': {
      apt::source { 'repo.powerdns.com':
        location    => 'http://repo.powerdns.com/debian',
        repos       => 'main',
        release     => 'jessie',
        include_src => false,
        require     => [Apt::Pin['dnsdist'], Apt::Key['powerdns']]
      }
    }
  }

  package { 'dnsdist':
    ensure  => present,
    require => [Apt::Source['repo.powerdns.com']];
  }

}
