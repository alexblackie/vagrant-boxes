#!/bin/bash

run() {
  $@ >> /vagrant/provision.log 2>&1
}

run sudo yum install -y nginx php-fpm mysql-server php-gd php-pdo php-mbstring gd gd-devel
run sudo systemctl enable nginx.service
run sudo systemctl enable mariadb.service
run sudo systemctl enable php-fpm.service
run sudo chown vagrant:vagrant /etc/nginx/nginx.conf
run sudo sed -i 's/apache/vagrant/g' /etc/php-fpm.d/www.conf
