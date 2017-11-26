#!/bin/bash
wp="/usr/bin/php-5.6-cli ./wp-cli.phar"
${wp} plugin update --all
${wp} theme update --all
${wp} core update
${wp} core verify-checksums
${wp} cli update --yes
