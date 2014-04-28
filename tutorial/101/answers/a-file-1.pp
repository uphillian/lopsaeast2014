# puppet-apply a-file-1.pp
file {'/home/lopsa/motd':
  content => "Welcome to LOPSA-East!\n",
  mode    => 0644,
}
