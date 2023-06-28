#!/bin/bash

# disable root login
sudo vim /etc/ssh/sshd_config
# PermitRootLogin no

sudo systemctl restart sshd

# change default ssh port
sudo vim /etc/ssh/sshd_config
# Port 8820

sudo systemctl restart sshd

# Disable password authentication
sudo vim /etc/ssh/sshd_config
# PasswordAuthentication no

sudo systemctl restart sshd

# Enable AppArmor
sudo systemctl status apparmor

sudo systemctl start apparmor

sudo systemctl enable apparmor

sudo apparmor_status

# Configure the firewall to allow SSH connections
sudo ufw allow ssh

sudo ufw enable

# Configure the firewall to allow HTTP and HTTPS connections
sudo ufw allow http
sudo ufw allow https

# Configure the firewall to whitelist IPs
sudo ufw allow from #.#.#.#

# Update
sudo apt update

# Simulate Upgrade
sudo apt upgrade -s

# Upgrade individual packages
sudo apt-get install --only-upgrade $packagename

# remove unused packages
sudo apt autoremove

# Remove unused packages with Deborphan
deborphan

apt-get remove $packagename

# install fail2ban
sudo apt install file2ban

sudo systemctl enable fail2ban

sudo systemctl start fail2ban

sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# add your IP to the ignoreip list
ignoreip = 127.0.0.1/8 ::1 put.your.ip.here

bantime = 10m

maxretry = 5

findtime = 10m

sudo systemctl restart fail2ban

