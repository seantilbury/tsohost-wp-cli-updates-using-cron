#!/bin/bash

# set path to wpcli #
wp="/usr/bin/php-5.6-cli -c ./php.ini ./wp-cli.phar"

# verify core files against checksums #
${wp} core verify-checksums
