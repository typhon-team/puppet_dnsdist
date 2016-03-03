define dnsdist::acl ($networkadres = $title) {
  concat::fragment { "acl-${title}":
    target  => "/etc/dnsdist/dnsdist.conf",
    content => template('dnsdist/ACL.erb'),
    order   => "45"
  }
}
