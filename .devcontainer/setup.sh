#!/bin/bash

# Variables
DB_NAME=wordpress
DB_USER=root
DB_PASSWORD=root
DB_HOST=localhost

# Install WordPress
if [ ! -f /workspace/wp-config.php ]; then
  wp core download --path=/workspace
  wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=$DB_HOST --path=/workspace
  wp db create --path=/workspace
  wp core install --url=localhost --title="WordPress Dev" --admin_user=admin --admin_password=admin --admin_email=admin@example.com --path=/workspace
fi

# Install dependencies
composer install
