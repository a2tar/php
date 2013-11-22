define php::module ($ensure = present,) {
  include apt::update

  package { $title:
    ensure  => $ensure,
    require => Class["apt::update"],
    notify  => Class["php5::fpm::service"],
  }
}
