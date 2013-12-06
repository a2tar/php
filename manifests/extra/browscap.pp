class php::extra::browscap ($ensure = present,) {
  $url = 'http://tempdownloads.browserscap.com/stream.php?Full_PHP_BrowscapINI'
  file { "/etc/php5/extra":
    ensure  => "directory",
    owner   => "root",
    group   => "root",
    mode    => 775,
    require => Package["php5-common"],
  } ->
  exec { "downloads_browscap_ini":
    command => "/usr/bin/wget $url -O /etc/php5/extra/browscap.ini",
    creates => "/etc/php5/extra/browscap.ini",
    require => File["/etc/php5/extra"],
  } ->
  file { "/etc/php5/conf.d/browscap.ini":
    ensure  => $ensure,
    owner   => 'root',
    group   => 'root',
    mode    => 0644,
    source  => "puppet:///modules/php/conf.d/browscap.ini",
    require => Package["php5-common"],
    notify  => Class["php::fpm::service"],
  }
}
