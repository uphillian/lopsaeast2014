# puppet apply a-service-1.pp
service {'sshd':
  ensure => false,
}
