# Define: dnsdist::newserver
#
#  Manages the backend servers of dnsdist
#
# Author
#   Hetzner ZA <kernels@hetzner.co.za>
#
# Version
#   0.2   Initial release
#
# Parameters:
#   $forward_adres
#   $pool
#   $resolver_name
# Requires:
#
# Sample Usage:
#
#   dnsdist::newserver {
#     '192.168.2.1':
#       pool => 'local',
#       resolver_name = 'ns1';
#   }
#
define dnsdist::newserver($newservers)
{
  concat::fragment { 'newservers':
    target  => '/etc/dnsdist/dnsdist.conf',
    content => template('dnsdist/newServers.erb'),
    order   => '20'
  }
}
