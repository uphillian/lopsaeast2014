# puppet apply a-file-3.pp
file {'/home/lopsa/welcome':
  content => template('/home/lopsa/tutorial/101/answers/a-file-3.erb'),
  mode    => 0644,
}
