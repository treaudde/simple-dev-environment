#SIMPLE DEV ENVIRONMENT
FROM php:7.3.5-apache-stretch

#INSTALL COMPOSER
RUN curl https://getcomposer.org/download/1.8.5/composer.phar --output composer.phar && \
    chmod +x composer.phar && mv composer.phar /usr/local/bin/composer

#INSTALL GIT, ZIP
RUN apt update && apt install -y git zip && rm -rf /var/lib/apt/lists/*

#Install Node / NPM
RUN curl -sL https://deb.nodesource.com/setup_10.x |  bash - && \
    apt install -y nodejs  && rm -rf /var/lib/apt/lists/*

#Install Global Gulp
RUN npm install -g gulp-cli && npm install -g sass



