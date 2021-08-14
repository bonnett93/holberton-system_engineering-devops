# create a file in /tmp
node default {
file{'/tmp/holberton':
  ensure  => present,
  mode    => '0744',
  owner   => 'www-data',
  group   => 'www-data',
  content => 'I love Puppet'}
}
