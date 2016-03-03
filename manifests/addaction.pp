define dnsdist::addaction ($action, $order) {
  concat::fragment { "addAction-${order}-${title}":
    target  => "/etc/dnsdist/dnsdist.conf",
    content => "${action}\n",
    order   => "50"
  }
}