#!/bin/bash
wp="/usr/bin/php-5.6-cli /var/sites/y/yourdomain.co.uk/wp-cli.phar"
cd /var/sites/y/yourdomain.co.uk/public_html/
${wp} db optimize