include php::fpm

php::fpm::pool { "billing": unix_socket_path => true, }

php::module { [
  "php5-curl",
  "php5-gd",
  "php5-mcrypt",
  "php5-mysql",
  "php5-sqlite",
  "php5-suhosin",
  "php5-xsl"]:
}
include php::extra::browscap

php::pear::module { "Net_GeoIP": }

