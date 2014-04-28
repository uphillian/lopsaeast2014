# puppet apply a-ordering-1.pp
package {'httpd':
  ensure => installed,
}

service {'httpd':
  ensure  => true,
  enable  => true,
  require => Package['httpd'],
}

file {'/var/www/html/index.html':
  content => "<html>\n<head><title>LOPSA-East 2014</title></head>\n<body>\nWelcome to Puppet 101 at LOPSA-East 2014\n</body>\n</html>\n",
  mode    => 0644,
  owner   => apache,
  require => Package['httpd']
}
