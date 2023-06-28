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

