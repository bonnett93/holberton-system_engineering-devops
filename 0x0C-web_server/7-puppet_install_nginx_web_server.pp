# Install Nginx web server (w/ Puppet)
package{'nginx':
  ensure  => installed}
file{'/var/www/html/index.html':
  ensure  => present,
  content => 'Holberton School'}
suffix="server_name _;"
new_string_3="\n\tlocation /redirect_me{\n\t\treturn 301 https://www.linkedin.com/in/jordan-bonnett-gomez/;\n\t}"
exec{"sed -i "/${suffix}/a\\${new_string_3}" /etc/nginx/sites-available/default":
  path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin']}
exec{"sudo service nginx restart":
  path => ['/usr/bin', '/sbin', '/bin', '/usr/sbin']}
