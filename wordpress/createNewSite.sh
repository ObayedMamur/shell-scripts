#!/bin/sh
#This shell script can help you create WordPress Sites with wp-cli on your local environment

#Setting up variables
if [[ "$1" != "" ]]; then
    SITE_NAME="$1"
else
    SITE_NAME="newSite"
fi

#Check if wp-cli is installed or not
wp --version
if [[ $? -eq 0 ]]; then
    echo "WP-CLI Installed."
else
    echo "WP-CLI is not installed!"
    echo "Installing WP-CLI ...."
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
    php wp-cli.phar --info
    chmod +x wp-cli.phar
    mv wp-cli.phar /usr/local/bin/wp
fi

#Download and Extract WordPress Files and Create Directory
echo "Downloading WordPress Latest Files from wordpress.org..."
wp core download --path=$SITE_NAME --locale=en_US
cd $SITE_NAME
#Generating a config file
wp config create --dbname=$SITE_NAME --dbuser=root

#Create the database
wp db create

#Install WordPress
wp core install --url=$SITE_NAME.test --title="$SITE_NAME" --admin_user=admin --admin_password=admin --admin_email=admin@$SITE_NAME.test