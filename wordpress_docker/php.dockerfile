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
    SSL_MODE="full" \
    client_max_body_size=2M \
    clear_env=no \
    allow_url_fopen=On \
    allow_url_include=Off \
    display_errors=Off \
    file_uploads=On \
    max_execution_time=0 \
    max_input_time=-1 \
    max_input_vars=1000 \
    memory_limit=1024M \
    post_max_size=8M \
    upload_max_filesize=200M

RUN touch /var/log/error_log
ADD ./php/www.conf /usr/local/etc/php-fpm.d/www.conf
ADD ./php/uploads.ini /usr/local/etc/php/conf.d/uploads.ini

RUN echo 'memory_limit = 1024M' >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini;

RUN addgroup -g 1000 wp && adduser -G wp -g wp -s /bin/sh -D wp
RUN mkdir -p /var/www/html
RUN chown wp:wp /var/www/html

WORKDIR /var/www/html

RUN apk  add --no-cache \
        php81 \
        php81-fpm \
        php81-opcache \
        php81-pecl-apcu \
        php81-mysqli \
        php81-pgsql \
        php81-json \
        php81-openssl \
        php81-curl \
        php81-zlib \
        php81-soap \
        php81-xml \
        php81-fileinfo \
        php81-phar \
        php81-intl \
        php81-dom \
        php81-xmlreader \
        php81-ctype \
        php81-session \
        php81-iconv \
        php81-tokenizer \
        php81-zip \
        php81-simplexml \
        php81-mbstring \
        php81-gd \
        nginx \
        runit \
        curl \
        libxml2-dev \
        curl-dev \
        libzip-dev \
        libpng-dev \
        oniguruma-dev

RUN docker-php-ext-install mysqli pdo pdo_mysql xml zip curl gd mbstring && docker-php-ext-enable pdo_mysql

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp