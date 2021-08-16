# create the file ssh/config
file{'~/.ssh/ssh_config'
  ensure  => present,
  content => 'PasswordAuthentication no
              IdentityFile ~/.ssh/holberton'
  }
