#!/bin/bash
# Disable enterprise repository
sed -i.bak "s/^deb/\\\\#deb/" /etc/apt/sources.list.d/pve-enterprise.list

# Disable ceph repository
sed -i.bak "s/^deb/\\\\#deb/" /etc/apt/sources.list.d/ceph.list

# Enable community repository
echo "deb <http://download.proxmox.com/debian/pve> bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
echo "deb <http://download.proxmox.com/debian/pve> bookworm pve-no-subscription" > /etc/apt/sources.list.d/pve-no-enterprise.list

# Enable security repository
echo "deb <http://security.debian.org/debian-security> bookworm/updates main contrib" >> /etc/apt/sources.list

# Update repositories
apt-get update

# Run upgrade
apt-get upgrade -y
