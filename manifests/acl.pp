# Define: dnsdist::acl
#
#  Manages the ACL of dnsdist
#
# Author
#   Hetzner ZA <kernels@hetzner.co.za>
#
# Parameters:
#   $networkadres = $title
#
# Requires:
#
# Sample Usage:
#
#   dnsdist::acl { [
#     '192.168.1.0/24']:
#   }
#
define dnsdist::acl ($networkadres = $title) {
  concat::fragment { "acl-${title}":
    target  => "/etc/dnsdist/dnsdist.conf",
    content => template('dnsdist/ACL.erb'),
    order   => "45"
  }
}
