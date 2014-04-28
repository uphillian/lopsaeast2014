# puppet-apply a-file-2.pp
file {'/home/lopsa/message':
  source => '/etc/motd',
  mode   => 0644,
}
