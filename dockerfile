FROM library/debian:jessie

RUN apt-get update && \
    apt-get install -y apache2 php5 php-pear

RUN a2enmod rewrite headers ssl

RUN a2dismod status

RUN ln -sf /dev/stdout /var/log/apache2/access.log

RUN ln -sf /dev/stderr /var/log/apache2/error.log

ENTRYPOINT ["apachectl", "-D", "FOREGROUND"]

EXPOSE 80 443

