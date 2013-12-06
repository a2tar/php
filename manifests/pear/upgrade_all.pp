class php::pear::upgrade_all {
  exec { "pear_upgrade_all":
    command     => "/usr/bin/pear upgrade-all",
    refreshonly => true,
  }
}
