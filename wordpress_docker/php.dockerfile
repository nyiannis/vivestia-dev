FROM php:8.1-fpm-alpine3.17

LABEL maintainer="NG"

ENV MSMTP_RELAY_SERVER_HOSTNAME="localhost" \
    MSMTP_RELAY_SERVER_PORT="2525" \
    PHP_POOL_NAME="www" \
    PHP_PM_CONTROL=ondemand \
    PHP_PM_MAX_CHILDREN="20" \
    PHP_PM_START_SERVERS="2" \
    PHP_PM_MIN_SPARE_SERVERS="1" \
    PHP_PM_MAX_SPARE_SERVERS="3" \
    SSL_MODE="full"

RUN touch /var/log/error_log
ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf
ADD ./php/uploads.ini /usr/local/etc/php/conf.d/uploads.ini

RUN echo 'memory_limit = 1024M' >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini;

RUN addgroup -g 1000 wp && adduser -G wp -g wp -s /bin/sh -D wp
RUN mkdir -p /var/www/html
RUN chown wp:wp /var/www/html

WORKDIR /var/www/html

RUN apk add --no-cache libxml2-dev curl-dev libzip-dev libpng-dev oniguruma-dev
RUN docker-php-ext-install mysqli pdo pdo_mysql xml zip curl gd mbstring && docker-php-ext-enable pdo_mysql

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp