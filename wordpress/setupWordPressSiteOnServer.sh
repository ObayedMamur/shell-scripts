#!/bin/bash

# Function to display step information
display_step() {
    echo "[$1/$TOTAL_STEPS] $2"
}

# Set total steps
TOTAL_STEPS=27

# Step 1: Configuring Swapfile
display_step 7 "Configuring Swapfile"
sudo fallocate -l 1G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab

# Step 2: Upgrading System
display_step 8 "Upgrading System"
sudo apt update && sudo apt upgrade -y

# Step 3: Installing Base Dependencies
display_step 9 "Installing Base Dependencies"
sudo apt install -y build-essential curl wget gnupg2 ca-certificates lsb-release software-properties-common unzip

# Step 4: Updating Authentication Method
display_step 10 "Updating Authentication Method"
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd

# Step 5: Updating Hostname
display_step 11 "Updating Hostname"
sudo hostnamectl set-hostname your_hostname

# Step 6: Updating Timezone
display_step 12 "Updating Timezone"
sudo timedatectl set-timezone your_timezone

# Step 7: Setting Up xcloud Users
display_step 13 "Setting Up xcloud Users"
# Add commands to create users if needed

# Step 8: Setting Up SSH
display_step 14 "Setting Up SSH"
# Add commands to configure SSH keys if needed

# Step 9: Setting Up Sudo Permissions
display_step 15 "Setting Up Sudo Permissions"
# Add commands to configure sudo permissions if needed

# Step 10: Setting Up Git
display_step 16 "Setting Up Git"
sudo apt install -y git

# Step 11: Setting Up Firewall
display_step 17 "Setting Up Firewall"
sudo ufw allow OpenSSH
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp
sudo ufw enable

# Step 12: Setting Up Cleaning Script
display_step 18 "Setting Up Cleaning Script"
# Add commands to create a cleaning script if needed

# Step 13: Installing PHP 8.1
display_step 19 "Installing PHP 8.1"
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install -y php8.1 php8.1-cli php8.1-common php8.1-mysql php8.1-xml php8.1-xmlrpc php8.1-curl php8.1-gd php8.1-imagick php8.1-cli php8.1-dev php8.1-imap php8.1-mbstring php8.1-opcache php8.1-soap php8.1-zip php8.1-intl

# Step 14: Installing Nginx
display_step 20 "Installing Nginx"
sudo apt install -y nginx

# Step 15: Installing Node.js
display_step 21 "Installing Node.js"
curl -fsSL https://deb.nodesource.com/setup_16.x | sudo -E bash -
sudo apt install -y nodejs

# Step 16: Installing Redis
display_step 22 "Installing Redis"
sudo apt install -y redis-server

# Step 17: Installing MySQL Database
display_step 23 "Installing MySQL Database"
sudo apt install -y mysql-server

# Step 18: Installing WP CLI
display_step 24 "Installing WP CLI"
sudo apt install -y wp-cli

# Step 19: Setting SSH Permissions
display_step 25 "Setting SSH Permissions"
# Add commands to set SSH permissions if needed

# Step 20: Installing WordPress
display_step 26 "Installing WordPress"
# Add commands to download and configure WordPress

# Step 21: Final Step
display_step 27 "Finishing Up"
echo "Provisioning complete."
