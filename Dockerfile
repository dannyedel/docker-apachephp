FROM debian:stable
MAINTAINER mail@danny-edel.de

COPY sources.list /etc/apt/
COPY 80retry.conf /etc/apt/apt.conf.d/

RUN export DEBIAN_FRONTEND=noninteractive \
	&& apt-get update \
	&& apt-get -y dist-upgrade \
	&& apt-get -y install libapache2-mod-php5 \
		supervisor

COPY supervisord.conf /etc/supervisor/conf.d/

COPY php.ini /etc/php5/apache2/

EXPOSE 80

VOLUME [ "/var/www/html" ]

ENTRYPOINT [ "/usr/bin/supervisord" ]
