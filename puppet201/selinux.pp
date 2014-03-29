class selinux ($config = 'enforcing') {
  case $config {
    'enforcing':  { 
      exec {'selinux_enforcing':
        command => '/usr/sbin/setenforce 1',
      }
    }
    /permissive|disabled/: { 
      exec {'selinux_permissive':
        command => '/usr/sbin/setenforce 0',
        }
    }
  }
  file {'/etc/selinux/config':
    content => "SELINUX=$config\nSELINUXTYPE=targeted\n",
  }
}

node default {
  class {'selinux':
    config => 'permissive'
  }
}
