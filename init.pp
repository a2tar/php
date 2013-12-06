class php::pear ($ensure = present,) {
  package { "php-pear":
    ensure  => latest,
    require => Package["php5-common"],
  }
}
