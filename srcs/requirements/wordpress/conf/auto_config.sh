#! /bin/sh

sleep 10 

wp core download --locale=fr_FR --allow-root --path='/var/www/html/wordpress/'

wp config create --allow-root \
	--dbname=$DB_NAME \
	--dbuser=$DB_ADMIN \
	--dbpass=$DB_ADMIN_PASSWORD \
	--dbhost="mariadb" \
	--path='/var/www/html/wordpress/'

wp core install --url=$DB_HOST \
				--title=$WP_TITLE \
				--admin_user=$DB_ADMIN \
				--admin_password=$DB_ADMIN_PASSWORD \
				--admin_email=$ADMIN_MAIL \
				--allow-root \
				--path='/var/www/html/wordpress/'

mkdir -p /run/php/php7.3

exec php-fpm7.3 -F