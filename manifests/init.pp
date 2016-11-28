# Class: dnsdist
#
# This class installs and manages dnsdist
#
# Author
#   Hetzner ZA <kernels@hetzner.co.za>
#
# Version
#   0.2  Refactored release with debian distribution support 
#
# Parameters:
#   $webserver        = '0.0.0.0:80',
#   $webserver_pass   = 'geheim'
#   $control_socket   = '127.0.0.1'
#   $listen_addresses = '0.0.0.0'
#   $distribution     = 'debian'
#
# Requires:
#   concat
#   apt
#
# Sample Usage:
#
#   class { 'dnsdist':
#    webserver        => '192.168.1.1:80',
#    listen_addresses => [ '192.168.1.1' ];
#  }
#

class dnsdist (
  $webserver        = $dnsdist::params::webserver,
  $webserver_pass   = $dnsdist::params::webserver_pass,
  $control_socket   = $dnsdist::params::control_socket,
  $listen_addresses = $dnsdist::params::listen_addresses,
  $distribution     = $dnsdist::params::distribution
) inherits ::dnsdist::params {

  include ::dnsdist::service

  class { '::dnsdist::package':
    distribution => $distribution
  }

  class { '::dnsdist::config':
    webserver        => $webserver,
    webserver_pass   => $webserver_pass,
    control_socket   => $control_socket,
    listen_addresses => $listen_addresses
  }

}
