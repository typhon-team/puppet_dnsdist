define dnsdist::maintenance ($dynblocks = []) {
  concat::fragment { "maintenance-${title}":
    target  => "/etc/dnsdist/dnsdist.conf",
    content => template('dnsdist/maintenance.erb'),
    order   => "45"
  }
}
