#! /bin/bash
dir=$(cd -P -- "$(dirname -- "$0")" && pwd -P)

if [ ! $1 ]; then
	echo '데이터베이스 비밀번호를 입력해주세요'
	exit 1
fi

echo '
WEB_USER=www-data
WEB_GROUP=www-data
 
APACHE_IP=192.168.0.11
APACHE_EXPOSED_PORT=80
APACHE_ROOT_DIR=/usr/local/apache2
 
MYSQL_IP=192.168.0.22
MYSQL_CONTAINER_USER=mysql
MYSQL_CONTAINER_GROUP=mysql
MYSQL_USER=omekas
MYSQL_PASSWORD='$1'
MYSQL_ROOT_PASSWORD='$1'
MYSQL_DATA_DIR=/var/lib/mysql
MYSQL_LOG_DIR=/var/log/mysql
MYSQL_DATABASE=omekas
 
PHP_IP=192.168.0.33
PHP_APP_DIR=/srv/app
PHP_ROOT_DIR=/usr/local/etc
 
NETWORK_SUBNET=192.168.0.0/24' > ${dir}/.env

echo 'user     = omekas
password = '$1'
dbname   = omekas
host     = omeka_maria_con
;port     = 
;unix_socket =
;log_path = ' > ${dir}/htdocs/config/database.ini

chmod -R 777 ${dir}/htdocs/files
chmod -R 777 ${dir}/htdocs/modules
chmod -R 777 ${dir}/htdocs/themes

cd ${dir}/htdocs/modules
wget https://github.com/Daniel-KM/Omeka-S-module-EasyInstall/releases/download/3.2.3/EasyInstall.zip
unzip EasyInstall.zip
rm EasyInstall.zip