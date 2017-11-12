#!/bin/bash
wp="/usr/bin/php-5.6-cli ./wp-cli.phar"
cd ./public_html/
${wp} db optimize
