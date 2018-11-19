FROM php:7.1-fpm-alpine

ARG WEB_USER
ARG WEB_GROUP
ARG PHP_ROOT_DIR

RUN apk add --update re2c freetype-dev libpng-dev libjpeg-turbo-dev libxml2-dev autoconf g++ imagemagick imagemagick-dev curl-dev libtool make \
	&& docker-php-ext-configure gd \
	--with-gd \
	--with-freetype-dir=/usr/include/ \
	--with-png-dir=/usr/include/ \
	--with-jpeg-dir=/usr/include/ \
	&& docker-php-ext-install gd \
	&& docker-php-ext-install mbstring \
	&& docker-php-ext-install mysqli \
	&& docker-php-ext-install opcache \
	&& docker-php-ext-install soap \
	&& docker-php-ext-install pdo \
	&& docker-php-ext-install pdo_mysql \
	&& pecl install imagick \
	&& docker-php-ext-enable imagick \
	&& pecl install solr \
	&& docker-php-ext-enable solr \
	&& apk del autoconf g++ libtool make \
	&& rm -rf /tmp/* /var/cache/apk/*

COPY www.conf ${PHP_ROOT_DIR}/php-fpm.d/www.conf
COPY php.ini ${PHP_ROOT_DIR}/php/php.ini