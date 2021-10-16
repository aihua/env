#!/bin/sh

tail -n 2 etc/environment >> /etc/environment
cp -f etc/default/locale  /etc/default/locale

cp -f etc/apt/apt.conf.d/01translate /etc/apt/apt.conf.d/
cp -f etc/apt/sources.list /etc/apt/sources.list

mkdir -p /var/lib/locales/supported.d
cp -fr var/lib/locales/supported.d/* /var/lib/locales/supported.d/
cp -f etc/skel/.vimrc /etc/skel/.vimrc
cp -f /etc/skel/.vimrc ~/

su -c 'sh -s' <<EOF
locale-gen

apt-get -y update
apt-get -y upgrade

apt-get -y purge nano

apt-get -y install build-essential lftp p7zip p7zip-rar unzip fonts-arphic-bkai00mp fonts-arphic-bsmi00lp fonts-arphic-gbsn00lp fonts-arphic-gkai00mp fonts-arphic-ukai fonts-arphic-uming mysql-client nginx php-cli php-fpm php-bcmath php-curl  php-gd php-gettext php-igbinary php-intl php-mbstring php-mysql php-redis php-seclib php-xmlrpc php-zip php-gmp

apt-get -y install libmcrypt-dev libreadline-dev php-dev

printf "\n" | pecl install mcrypt-1.0.1

cp -f etc/php/7.4/mods-available/mcrypt.ini /etc/php/7.4/mods-available/mcrypt.ini
phpdismod fileinfo
phpenmod mcrypt
cp -f etc/php/7.4/fpm/php-fpm.conf /etc/php/7.4/fpm/php-fpm.conf
cp -f etc/php/7.4/fpm/pool.d/www.conf /etc/php/7.4/fpm/pool.d/www.conf

cp -f etc/nginx/conf.d/proxy.conf /etc/nginx/conf.d/proxy.conf
cat etc/nginx/nginx.conf > /etc/nginx/nginx.conf
cp -f etc/nginx/sites-available/example.com /etc/nginx/sites-available/example.com
rm -f /etc/nginx/sites-enabled/default
ln -s /etc/nginx/sites-available/example.com /etc/nginx/sites-enabled/example.com
cp -f etc/nginx/snippets/pathinfo.conf /etc/nginx/snippets/pathinfo.conf
cp -r etc/nginx/ssl /etc/nginx/


EOF
