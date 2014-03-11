package {'httpd':
  ensure => present
}
service {"httpd":
  enable     => true,
  ensure     => running,
  hasrestart => true,
  hasstatus  => true,
  require => [Package['httpd'],File['host.conf']]
}
file {"host.conf":
  path => "/etc/httpd/conf.d/$name",
  mode => 0644,
  owner => 'apache',
  group => 'apache',
  content => "<VirtualHost *:80>
    ServerName kermit.henson.local
    DocumentRoot /var/www/html/kermit
    </Virtualhost>",
  require => Package['httpd']
}
