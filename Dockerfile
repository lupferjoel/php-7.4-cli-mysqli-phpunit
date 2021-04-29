FROM php:7.4-cli

RUN apt-get update && \
    apt-get install -y \
    libzip-dev \
    libjpeg-dev \
    libpng-dev \
    libwebp-dev

RUN docker-php-ext-configure gd --enable-gd --with-jpeg --with-webp

RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd

RUN docker-php-ext-configure mysqli --with-mysqli=mysqlnd

RUN docker-php-ext-install gd mysqli pdo pdo_mysql exif

RUN wget https://phar.phpunit.de/phpunit-9.5.4.phar

RUN chmod +x phpunit-9.5.4.phar

RUN sudo mv phpunit-9.5.4.phar /usr/local/bin/phpunit

RUN phpunit --version
