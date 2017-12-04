#!/bin/bash

# set path to wpcli #
wp="/usr/bin/php-5.6-cli ./wp-cli.phar"

# update WordPress core #
${wp} core update
