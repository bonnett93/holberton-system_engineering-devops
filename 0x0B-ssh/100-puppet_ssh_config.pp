# create the file ssh/config
node default{
  file{'~/.ssh/ssh_config'
  ensure  => present,
  content => 'PasswordAuthentication no
              IdentityFile ~/.ssh/holberton'


  }
}
