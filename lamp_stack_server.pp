package { 'apache2':
  ensure => installed,
}

package { 'php':
  ensure => installed,
  notify  => Service['apache2'],
  require => [Package['apache2']],
}

service { 'apache2':
  ensure => running,
  enable => true,
  require => [Package['apache2'], Package['php']]
}
# lamp_stack_server.pp

package { 'libapache2-mod-php':
  ensure => installed,
  require => Package['apache2'],
}

package { 'php-cli':
  ensure => installed,
  require => Package['php'],
}

package { 'php-mysql':
  ensure => installed,
  require => Package['php'],
}
file { '/var/www/html/phpinfo.php':
  source => '/ih_inet4031_puppet_lab9/puppet_manifests',
  notify  => Service['apache2'],
  require => [Package['apache2']]
}
package { 'mariadb-server':
  ensure => installed,
}

service { 'mariadb':
  ensure => running,
  enable => true,
}

