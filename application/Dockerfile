# ###############################################################################
# Base image
################################################################################

FROM ubuntu:16.04

################################################################################
# Build instructions
################################################################################

RUN apt-get update && \
    apt-get install -y nodejs \
                       curl \
                       openssl \
                       ca-certificates \
                       apt-transport-https \
                       --no-install-recommends && \
                       rm -rf /var/lib/apt/lists/*

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | \
    apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | \
    tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && \
    apt-get install -y git \
                       build-essential \
                       libssl-dev \
                       yarn \
                       php7.0 \
                       php7.0-dom \
                       php7.0-zip \
                       php7.0-curl \
                       php7.0-mcrypt \
                       php7.0-mbstring

RUN mkdir -p /usr/bin

RUN /usr/bin/php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN /usr/bin/php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
RUN /usr/bin/php composer-setup.php --install-dir=/usr/bin --filename=composer && chmod +x /usr/bin/composer

RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN ln -s /usr/bin/nodejs /usr/bin/node

ENV NVM_DIR /usr/local/.nvm

RUN mkdir -p /usr/local/bin/docker

ADD ./bin/docker/upgrade.sh /usr/local/bin/docker/upgrade.sh
RUN chmod +x /usr/local/bin/docker/upgrade.sh

RUN mkdir -p /var/app
RUN mkdir -p /var/www/default

COPY ./deploy /var/app

WORKDIR /var/app

ENTRYPOINT ["/usr/local/bin/docker/upgrade.sh"]
