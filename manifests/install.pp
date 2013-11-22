class php::install ($ensure = present,) {
  include apt

  package { ["php5-cli", "php5-common"]:
    ensure  => $ensure,
    require => Class["apt::update"],
  }
}
