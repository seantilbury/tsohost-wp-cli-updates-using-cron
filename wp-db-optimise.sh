#!/bin/bash

# sets path to wpcli #
wp="/usr/bin/php-5.6-cli -c ./php.ini ./wp-cli.phar"

# runs database optimise #
${wp} db optimize
