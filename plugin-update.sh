#!/bin/bash

# set path to wpcli #
wp="/usr/bin/php-5.6-cli ./wp-cli.phar"

# update all plugins #
${wp} plugin update --all