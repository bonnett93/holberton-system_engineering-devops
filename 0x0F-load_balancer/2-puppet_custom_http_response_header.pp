# Add a custom HTTP header with Puppet

exec {'sudo apt-get -y update':
	path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin']
}

package {'instalar nginx':
	ensure => present,
	name   => nginx,
}

exec {'echo "Holberton School for the win!" >> /var/www/html/index.html':
	path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin']
}

suffix='server_name _;'
new_string_3='\n\tlocation /redirect_me{\n\t\treturn 301 https://www.linkedin.com/in/jordan-bonnett-gomez/;\n\t}'
exec {'sed -i "/$suffix/a\\$new_string_3" /etc/nginx/sites-available/default':
	path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin']
}

exec{'sudo echo "Ceci n'est pas une page" >> /var/www/html/error404.html':
	path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin']
}

new_string_4="\n\terror_page 404 /error404.html;"
exec {'sed -i "/$suffix/a\\$new_string_4" /etc/nginx/sites-available/default':
	path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin']
}

new_string_F0='\n\tadd_header X-Served-By $hostname;\n'
exec{'sed -i "/$suffix/a\\$new_string_F0" /etc/nginx/sites-available/default':
	path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin']
}

exec{'sudo service nginx restart':
	path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin']
}
