#!/bin/bash
sed -i -e "s/host = localhost/host = ${OJS_DB_HOST}/g" /var/www/ojs/config.inc.php
sed -i -e "s/username = ojs/username = ${OJS_DB_USER}/g" /var/www/ojs/config.inc.php
sed -i -e "s/password = ojs/password = ${OJS_DB_PASSWORD}/g" /var/www/ojs/config.inc.php
sed -i -e "s/name = ojs/name = ${OJS_DB_NAME}/g" /var/www/ojs/config.inc.php

# Start the cron service in the background.
crond -f &
echo "[OJS Startup] Started cron"

# Run the apache process in the foreground as in the php image
echo "[OJS Startup] Starting php-fpm..."
php-fpm
