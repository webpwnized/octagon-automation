#!/bin/bash

# Update list of available packages
apt-get update

# Install hydra
apt-get install hydra

# Update Kali
apt-get dist-upgrade -y

# Clean up files
apt-get autoremove -y
apt clean
