# Add a custom HTTP header with Puppet

exec {'sudo apt-get -y update':
	command => 'sudo apt-get -y update',
	path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin']
}
->

package {'instalar nginx':
	ensure => present,
	name   => nginx,
}

exec {'echo "Holberton School for the win!" >> /var/www/html/index.html':
	path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin']
}

exec {'modify default nginx':
	command => 'sudo sed -i "/server_name _;/a\\\n\tlocation /redirect_me{\n\t\treturn 301 https://www.google.com;\n\t}" /etc/nginx/sites-available/default',
	path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin']
}

exec{'Add 404 page':
	command => 'echo "Ceci n\'est pas une page" > /var/www/html/error404.html',
	path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin']
}

exec {'Addd 404 in default nginx':
	command => 'sed -i "/server_name _;/a\\\n\terror_page 404 /error404.html;" /etc/nginx/sites-available/default',
	path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin']
}

file_line {'Add new header':
	ensure => present,
	path => '/etc/nginx/sites-available/default',
	after => 'server_name _;',
	line => '\n\tadd_header X-Served-By ${hostname};\n'
}

exec {'restart nginx':
	command => 'sudo service nginx restart',
	path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin']
}
