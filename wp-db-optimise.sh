#!/bin/bash

# sets path to wpcli #
wp="/usr/bin/php-5.6-cli ./wp-cli.phar"

# runs database optimise #
${wp} db optimize
