<?php phpinfo(); ?>
file { '/var/www/html/phpinfo.php':
  source => '/ih_inet4031_puppet_lab9/puppet_manifests',
  notify  => Service['apache2'],
  require => [Package['apache2']]

}
