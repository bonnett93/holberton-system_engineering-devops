# Install Nginx web server (w/ Puppet)
package {'nginx':
  ensure  => installed
}

file {'/var/www/html/index.html':
  ensure  => present,
  content => 'Holberton School'
}

file_line {'/etc/nginx/sites-available/default':
  ensure => 'present',
  after  => 'server_name _;',
  line   => '\n\tlocation /redirect_me{\n\t\treturn 301 https://www.linkedin.com/in/jordan-bonnett-gomez/;\n\t}',
}

service {'nginx':
  ensure  => running,
  require => Package['nginx'],
}
