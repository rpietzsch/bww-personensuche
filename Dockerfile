FROM eccenca/baseimage:1.0.1

MAINTAINER René Pietzsch <rpietzsch@gmail.com>

RUN export DEBIAN_FRONTEND=noninteractive

RUN apt-get update

RUN apt-get install -qy apache2 libapache2-mod-proxy-html && \
	apt-get install -qy apache2-mpm-prefork apache2-utils  && \
	apt-get install -qy libapache2-mod-authnz-external git supervisor

# configure supervisord
RUN mkdir -p /etc/supervisor/conf.d
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD Jassa-Core/demo/facet-typeahead-odple /var/www/html

EXPOSE 80

ENV SPARQL_ENDPOINT https://odple-virtuoso.eccenca.com/
ENV BWW_GRAPH https://odple-ckan.eccenca.com/

CMD ["/usr/bin/supervisord"]
