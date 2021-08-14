# kills a process named killmenow.
node default {
exec{'pkill killmenow':
  path	   => ['/usr/bin', '/sbin', '/bin', '/usr/sbin']}
}
