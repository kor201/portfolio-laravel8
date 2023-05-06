FROM php:8.1-fpm
EXPOSE 5173
RUN apt-get update \
  && apt-get install -y libzip-dev unzip  wget git unzip libicu-dev libmemcached-dev zlib1g-dev libmagickwand-dev \
  && docker-php-ext-install zip pdo_mysql sockets opcache intl  \
  && pecl install memcached \
  && docker-php-ext-enable memcached \
  && pecl install imagick \
  && docker-php-ext-enable imagick \
  && docker-php-ext-configure gd \
  && docker-php-ext-install -j$(nproc) gd \
  # xdebug用
  && pecl install xdebug-3.1.6 \
  && docker-php-ext-enable xdebug \
  # xdebug用
  && apt-get clean && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/phpredis/phpredis.git /usr/src/php/ext/redis \
  && docker-php-ext-install redis \
  && rm -rf /usr/src/php/ext/redis
# コンテナ内でnpmコマンド叩く用
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
  && apt-get install -y nodejs

RUN apt-get update \
  && apt-get install -y imagemagick poppler-utils jpegoptim optipng \
  && ln -s /usr/bin/optipng /usr/local/bin/optipng \
  && ln -s /usr/bin/jpegoptim /usr/local/bin/jpegoptim \
  && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
