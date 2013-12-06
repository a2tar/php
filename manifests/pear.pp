class php::pear ($ensure = present,) {
  include php::pear::upgrade_all

  package { "php-pear":
    ensure  => latest,
    require => Package["php5-common"],
    notify  => Class["php::pear::upgrade_all"],
  }
}
