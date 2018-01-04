#!/bin/bash

# set path to wpcli #
wp="/usr/bin/php-5.6-cli -c ./php.ini ./wp-cli.phar"
# show existing core version
$ {wp} core version
# update WordPress core #
${wp} core update
