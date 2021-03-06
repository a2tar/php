class php::fpm (
  $ensure              = present,
  $display_errors      = 'Off',
  $post_max_size       = '10m',
  $upload_max_filesize = '10M',
  $timezone            = 'UTC',) {
  include apt
  include php::install
  include php::fpm::service

  package { "php5-fpm":
    ensure  => installed,
    require => Class["apt::update"],
  }

  file { "php-fpm.conf":
    path    => "/etc/php5/fpm/php-fpm.conf",
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template("php/fpm/php-fpm.conf.erb"),
    require => Package["php5-fpm"],
    notify  => Class["php::fpm::service"],
  }

  file { "php.ini":
    path    => "/etc/php5/fpm/php.ini",
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    content => template("php/fpm/php.ini.erb"),
    require => Package["php5-fpm"],
    notify  => Class["php::fpm::service"],
  }

  file { "default-pool":
    path   => "/etc/php5/fpm/pool.d/www.conf",
    ensure => absent,
    notify => Class["php::fpm::service"],
  }
}
