# puppet apply a-service-2.pp
service {'postfix':
  ensure => running,
  enable => true,
}
