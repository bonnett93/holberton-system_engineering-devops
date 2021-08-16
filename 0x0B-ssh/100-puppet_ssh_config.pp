# create the file ssh/config
file{'~/etc/ssh/ssh_config'
  ensure  => present,
  content => 'PasswordAuthentication no
              ~/.ssh/holberton'
}
