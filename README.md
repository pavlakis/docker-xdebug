# Xdebug

Docker images for:

* PHP 8.0 using Xdebug 3.0.3
* PHP 7.4 using Xdebug 2.9.8
* PHP 7.3 using Xdebug 2.7.0
* PHP 7.2 using Xdebug 2.6.1
* PHP 5.6 using Xdebug 2.4.1


Available images:

* pavlakis/xdebug:3.0.3
* pavlakis/xdebug:2.9.8
* pavlakis/xdebug:2.9.1
* pavlakis/xdebug:2.8.1
* pavlakis/xdebug:2.7.0
* pavlakis/xdebug:2.6.1
* pavlakis/xdebug:2.4.1


Each version is installed in a different folder:

* PHP 7.4 -> `/usr/local/lib/php/extensions/no-debug-non-zts-20190902/`
* PHP 7.3 -> `/usr/local/lib/php/extensions/no-debug-non-zts-20180731/`
* PHP 7.2 -> `/usr/local/lib/php/extensions/no-debug-non-zts-20170718/`
* PHP 5.6 -> `/usr/local/lib/php/extensions/no-debug-non-zts-20131226/`

## Usage

Example usage with PHP 7.3

> Dockerfile

```
FROM pavlakis/xdebug:2.7.0 AS xdebug
FROM pavlakis/php-apache-common:7.3.2

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini
COPY apache.conf /etc/apache2/sites-available/000-default.conf

COPY --from=xdebug /usr/local/lib/php/extensions/no-debug-non-zts-20180731/xdebug.so /usr/local/lib/php/extensions/no-debug-non-zts-20180731/xdebug.so

```

> xdebug.ini

```
; Enable xdebug extension module
zend_extension=xdebug.so

;xdebug.profiler_enable=0
xdebug.remote_enable=1
xdebug.remote_port=9000
xdebug.remote_autostart=1
xdebug.remote_connect_back=0
xdebug.idekey=editor-xdebug
```

> apache.conf (example)

```
<VirtualHost *:80>
   ServerAdmin webmaster@localhost
   DocumentRoot /var/www/html/public

   <Directory /var/www/html/public>
       AllowOverride None
       Order Allow,Deny
       Allow from All

       FallbackResource /index.php
   </Directory>

    ErrorLog ${APACHE_LOG_DIR}/error.log
    LogLevel warn

    CustomLog ${APACHE_LOG_DIR}/access.log combined

</VirtualHost>
```
