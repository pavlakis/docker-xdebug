#Xdebug

Docker images for:

* PHP 7.3 using Xdebug 2.7.0RC2
* PHP 7.2 using Xdebug 2.6.1
* PHP 5.6 using Xdebug 2.4.1


Available images:

* pavlakis/xdebug:2.7.0RC2
* pavlakis/xdebug:2.6.1
* pavlakis/xdebug:2.4.1


Each version is installed in a different folder:

* PHP 7.3 -> `/usr/local/lib/php/extensions/no-debug-non-zts-20180731/`
* PHP 7.2 -> `/usr/local/lib/php/extensions/no-debug-non-zts-20170718/`
* PHP 5.6 -> `/usr/local/lib/php/extensions/no-debug-non-zts-20131226/`

## Usage

Example usage with PHP 7.2

> Dockerfile

```
FROM pavlakis/xdebug:2.6.0 AS xdebug
FROM pavlakis/php-apache-common:7.2.11

COPY xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

COPY --from=xdebug /usr/local/lib/php/extensions/no-debug-non-zts-20170718/xdebug.so /usr/local/lib/php/extensions/no-debug-non-zts-20170718/xdebug.so

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