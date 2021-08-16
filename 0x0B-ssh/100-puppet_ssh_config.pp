# create the file ssh/config
file_line{'~/.etc/ssh/ssh_config'
  ensure  => 'present',
  content => '    PasswordAuthentication no
                  IdentityFile ~/.ssh/holberton'
}
