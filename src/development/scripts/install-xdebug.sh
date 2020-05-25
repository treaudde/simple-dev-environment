#!/bin/bash
#Export variables
XDEBUG_DOWNLOAD_URL="https://xdebug.org/files/xdebug-2.8.0beta2.tgz"
XDEBUG_WORKDIR="$(echo $(basename $XDEBUG_DOWNLOAD_URL) | sed 's/.tgz//g')"

#download xdebug and untar it to the working dir
wget $XDEBUG_DOWNLOAD_URL \
    && tar xvzf $(basename $XDEBUG_DOWNLOAD_URL)

#change to the working directory
cd "$XDEBUG_WORKDIR" || exit

#build and install xdebug
phpize
./configure --enable-xdebug
make
make install

#create the configuration file
echo "zend_extension=$(php-config --extension-dir)/xdebug.so
xdebug.remote_enable=1
xdebug.remote_handler=dbgp
xdebug.remote_autostart=1
xdebug.remote_host='host.docker.internal'
xdebug.remote_port=9000" >> /usr/local/etc/php/php.ini

#remove the working directory and exit
cd ../ || exit
rm -rf $XDEBUG_WORKDIR && rm -rf $(basename $XDEBUG_DOWNLOAD_URL)