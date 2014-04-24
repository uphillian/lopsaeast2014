define nfs::client (
  $mnt_opt = 'defaults',
  $svr_pnt = regsubst($title,"^.*:(.*)",'\1'),
  $mnt_pnt = regsubst($title,"^.*:(.*)",'\1'),
  $owner   = 0,
  $group   = 0,
  $pass    = 2,
  $dump    = 0
) {
  notify {"$title": }
  $server = regsubst($title,"^(.*):.*",'\1')
  notify {"server is $server, mnt_pnt is $mnt_pnt and svr_pnt is $svr_pnt": }
}
