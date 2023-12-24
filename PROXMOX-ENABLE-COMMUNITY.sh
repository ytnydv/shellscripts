#!/bin/bash
# Disable enterprise repository
sed -i.bak "s/^deb/\\#deb/" /etc/apt/sources.list.d/pve-enterprise.list

# Disable ceph repository
sed -i.bak "s/^deb/\\#deb/" /etc/apt/sources.list.d/ceph.list

# Enable community repository
echo "deb <http://download.proxmox.com/debian/pve> buster pve-no-subscription" > /etc/apt/sources.list.d/pve-install-repo.list
echo "deb <http://download.proxmox.com/debian/pve> buster pve-no-subscription" > /etc/apt/sources.list.d/pve-no-enterprise.list

# Update repositories
apt-get update
