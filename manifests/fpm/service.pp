class php::fpm::service {
  service { "php5-fpm":
    ensure     => running,
    hasstatus  => true,
    hasrestart => true,
    enable     => true,
  }
}
