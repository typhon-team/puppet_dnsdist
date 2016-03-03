define dnsdist::addpoolrule ($rules, $pool) {
  concat::fragment { "addpoolrule-${title}-${pool}":
    target  => "/etc/dnsdist/dnsdist.conf",
    content => template('dnsdist/addPoolRule.erb'),
    order   => "30"
  }
}