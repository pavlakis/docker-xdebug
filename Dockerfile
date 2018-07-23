FROM php:7.2.6-cli

RUN pecl install xdebug-2.6.0

RUN rm -rf /tmp/pear/

WORKDIR /usr/local/lib/php/extensions/no-debug-non-zts-20170718/