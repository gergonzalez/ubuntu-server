FROM ubuntu:16.04
USER root

ARG PASSWORD=root

WORKDIR /var/www

#Install basic environment
RUN apt-get -y update && \
    apt-get -y install \
    openssh-server \
	supervisor \
    nano \
    git \
    vim 

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install mysql-server 

#Server
RUN apt-get install -y \
	redis-server \
	apache2 \
	wget \
	curl \
	php \
	php-cli \
	libapache2-mod-php \
	php-gd \
	php-json \
	php-ldap \
	php-mbstring \
	php-mcrypt \
	php-mysql \
	php-opcache \
	php-curl \
	php-xml \
	php-xsl \
	php-zip \
	php-redis \
	php-xdebug \
	composer

#Set up SSH access
RUN mkdir /var/run/sshd
RUN sed -i.bak s/PermitRootLogin\ prohibit-password/PermitRootLogin\ yes/g  /etc/ssh/sshd_config
RUN echo "root:$PASSWORD" | chpasswd

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY vhosts.conf /etc/apache2/sites-available/000-default.conf
COPY redis.conf /etc/redis/redis.conf
RUN sed -Ei 's/^(bind-address|log)/#&/' /etc/mysql/mysql.conf.d/mysqld.cnf
RUN a2enmod rewrite
RUN a2enmod headers

EXPOSE 22 80

CMD ["/usr/bin/supervisord"]

VOLUME ["/var/lib/mysql", "/var/log/mysql", "/var/log/apache2"]
