define dnsdist::newserver ($forward_adres = $title, $pool = '', $resolver_name  = '') {
  concat::fragment { "newserver-${pool}-${forward_adres}":
    target  => "/etc/dnsdist/dnsdist.conf",
    content => template('dnsdist/newServer.erb'),
    order   => "20"
  }
}