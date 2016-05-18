FROM debian:jessie

MAINTAINER Maximiliano Osorio <mosorio@linets.cl>

RUN apt-get update && apt-get install -y \
    php5-common \
    php5-cli \
    php5-fpm \
    php5-mcrypt \
    php5-mysql \
    php5-apcu \
    php5-gd \
    php5-imagick \
    php5-curl \
    php5-intl \
    curl \
    netcat \
&& rm -rf /var/lib/apt/lists/*


ADD symfony.ini /etc/php5/fpm/conf.d/
ADD symfony.ini /etc/php5/cli/conf.d/

ADD symfony.pool.conf /etc/php5/fpm/pool.d/

RUN usermod -u 1000 www-data

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

COPY beebop_start.sh /usr/local/bin/beebop_start
RUN chmod 755 /usr/local/bin/beebop_start

CMD ["/usr/local/bin/beebop_start"]

EXPOSE 9000
