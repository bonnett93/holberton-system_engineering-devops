# create the file ssh/config
node default{
  file{'~/.ssh/ssh_config'
  ensure  => present,
  content => 'PasswordAuthentication no
              Host ubutu
                HostName 34.138.233.200
                User ubuntu
                Port 22
                IdentityFile ~/.ssh/holberton'
  }
}
