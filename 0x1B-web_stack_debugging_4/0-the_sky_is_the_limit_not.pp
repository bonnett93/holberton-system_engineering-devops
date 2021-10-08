# testing how well our web server setup featuring Nginx is doing under pressure
exec { 'Sky is the limit':
  environment => ['DIR=/etc/default/nginx',
                  'OLD=ULIMIT="-n 15"',
                  'NEW=ULIMIT="-n 15000"'],
  command     => 'sudo sed -i "s/$OLD/$NEW/" $DIR; sudo service nginx restart',
  path        => ['/usr/bin', '/bin'],
  returns     => [0, 1]
}
