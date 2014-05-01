define adminuser (
  $user = $title,
  $uid,
  $gid,
  $comment,
  $home = "/home/$title",
  $bashrc = "if [ -f /etc/bashrc ]; then . /etc/bashrc fi\n",
  $ssh_key_type = "ssh-rsa",
  $ssh_key ) {
    group {"$title":
      gid => $gid
    }
    user {"$title":
      gid     => $gid,
      uid     => $uid,
      home    => $home,
      comment => $comment,
      require => Group["$title"],
    }
    file {"$title .bashrc":
      path    => "$home/.bashrc",
      content => "$bashrc",
      mode    => 0644,
      require => User["$title"],
    }
    ssh_authorized_key {"ssh_key adminuser $title":
      key     => "$ssh_key",
      type    => "$ssh_key_type",
      user    => "$title",
      require => User["$user"],
    }
  }

  adminuser {'thomas':
    uid          => 2000,
    gid          => 2000,
    comment      => 'Thomas Uphill',
    bashrc       => "export PS1='[\\u@\\h]$ '",
    ssh_key_type => 'ssh-rsa',
    ssh_key      => 'AAA---ZZZZ',
  }
