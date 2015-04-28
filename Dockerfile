FROM eccenca/baseimage:1.0.1

MAINTAINER René Pietzsch <rpietzsch@gmail.com>

RUN export DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -qy apache2 libapache2-mod-proxy-html && \
	apt-get install -qy apache2-mpm-prefork apache2-utils  && \
	apt-get install -qy libapache2-mod-authnz-external git supervisor

# ADD 000-default.conf /etc/apache2/sites-available/000-default.conf

# configure supervisord
RUN mkdir -p /etc/supervisor/conf.d
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD Jassa-Core/demo/facet-typeahead-odple /var/www/html

EXPOSE 80

CMD ["/usr/bin/supervisord"]
