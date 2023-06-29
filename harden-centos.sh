#!/bin/bash

# disable root login
vim /etc/ssh/sshd_config

# PermitRootLogin no

# restart sshd daemon
sudo systemctl restart sshd

# change default ssh port
vim /etc/ssh/sshd_config

# Port 2283

# restart sshd daemon
sudo systemctl restart sshd

# disable password authentication
vim /etc/ssh/sshd_config

# PasswordAuthentication no

# restart sshd daemon
sudo systemctl restart sshd

# use the -i flag with the ssh command to specify the pem key
# ssh -i /path/to/key $username@hostname

# Enable SELinux
sudo sestatus

vim etc/selinux/config

# SELINUX=enforcing

# reboot to apply changes to SELINUX
sudo reboot

# verify SELinux mode
getenforce

# set to permissive
sudo setenforce 0

# set to enforce
sudo setenforce 1

# list all open ports and services
sudo firewall-cmd --list-all

# allow HTTPS
sudo firewall-cmd --zone=public --permanent --add-service=https

# allow HTTP
sudo firewall-cmd --zone=public --permanent --add-service=http

# restart firewalld
sudo firewall-cmd --reload

# allow connections from specific IPs
sudo firewall-cmd --zone=trusted --permanent --add-source=#.#.#.#

# restart firewalld
sudo firewall-cmd --reload

# update package info
sudo dnf check-update

# update all packages
sudo dnf update

# update individual packages
sudo dnf update $packagename

# remove unused packages
sudo dnf autoremove

# find and remove all temporary files
sudo dnf clean all

# install fail2ban
sudo dnf install fail2ban

# activate fail2ban
sudo systemctl enable fail2ban

# start fail2ban
sudo systemctl start fail2ban

# configure fail2ban
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# add IP to ignore list and uncomment the line
vim /etc/fail2ban/jail.local

# ignoreip 172.0.0.1
# bantime = 10m
# findtime = 10m
# maxretry = 5

# restart fail2ban
sudo systemctl restart fail2ban

# password protect GRUB bootloader
sudo grub2-setpassword

# disable ctrl+alt+del
sudo systemctl mask ctrl-alt-del.target

# check kernel config
sudo sysctl -system

# edit the kernel config
vim /etc/sysctl.conf

# Disable IP forwarding
net.ipv4.ip_forward = 0
# Disable source routing
net.ipv4.conf.default.accept_source_route = 0
# Disable the Magic System Request key
kernel.sysrq = 0
# Enable TCP SYN cookie protection
net.ipv4.tcp_syncookies = 1
# Enable SYN flood protection
net.ipv4.tcp_synack_retries = 5
# Don’t accept source-routed packets
net.ipv4.conf.all.accept_source_route = 0
# Don’t accept ICMP redirects
net.ipv4.conf.all.accept_redirects = 0
# Log packets with suspicious addresses
net.ipv4.conf.all.log_martians = 1
# Ignore broadcast requests
net.ipv4.icmp_echo_ignore_broadcasts = 1
# Ignore bad ICMP errors
net.ipv4.icmp_ignore_bogus_error_responses = 1

# 
