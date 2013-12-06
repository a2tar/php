define php::pear::module {
  include php::pear

  exec { "pear-install-${title}":
    path    => ["/usr/bin", "/usr/sbin", "/bin"],
    require => Class["php::pear"],
    command => "pear install $title",
    unless  => "pear list | grep $title",
  }
}
