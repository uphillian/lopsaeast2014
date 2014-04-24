define nfs::share ($path = $title, $nfsaccess = "*.$::domain", $nfsoptions = "rw,sync") {
# split options into an array, use an inline template to loop through the array and print the correct input for augeas.

  $nfsopts = split($nfsoptions,',')
  $options_set = inline_template("<% nfsopts.each do |opt| -%>set dir[.= \"<%= @path %>\"]/client[.=\"<%= @nfsaccess %>\"]/option[.=\"<%= opt %>\"] <%= opt%>\n<% end %>")
  # define exportfs
  include nfs
  # can't share without a server
  include nfs::server
  augeas { "share_${path}_${nfsaccess}_${nfsoptions}":
    context => "/files/etc/exports",
    changes => [
            "set dir[.= \"$path\"] $path",
            "set dir[.= \"$path\"]/client[.=\"$nfsaccess\"] $nfsaccess",
            split ($options_set, "\n"),
    ],
    notify => Exec['exportfs'],
  }
  Firewall <<| tag == "nfs::client::${::hostname}:$path" |>>
}

