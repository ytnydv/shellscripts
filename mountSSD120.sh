#!/bin/bash
# Declare the drive and directory variables
drive="/dev/sda1"
directory="/mnt/SSD120"

# Create the directory where you'd like to mount the drive
mkdir $directory

# Mount the drive to the directory
mount $drive $directory

# Add the mount to the fstab file to ensure it mounts at boot
echo "$drive $directory ext4 defaults 0 0" | tee -a /etc/fstab

# Change the permissions of the mounted drive for accessibility
chmod -R 777 $directory
