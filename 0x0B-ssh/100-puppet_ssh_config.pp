# create the file ssh/config
file{'~/.ssh/ssh_config'
  ensure  => present,
  content => 'PasswordAuthentication no
              ~/.ssh/holberton'
  }
