#!/bin/bash
export PATH=$PATH:/usr/local/bin

# --- 1. EXTEND THE EBS VOLUME SPACE ---
# (Using growpart for automation instead of interactive parted)
sudo dnf install cloud-utils-growpart -y #This installs the growpart tool
sleep 5
#This tells the "Physical Disk" (/dev/nvme0n1) to expand Partition 4 to fill the remaining empty space on the 50GB drive.
sudo growpart /dev/nvme0n1 4

# Since you are using LVM, your partition acts as a "Physical Volume" (PV).
# Even though the partition is now 50GB, the LVM software doesn't know that yet.
# This command updates the LVM metadata to say, "Hey, this PV just got bigger; 
# we have more room for activities."
sudo pvresize /dev/nvme0n1p4

# Your disk is now 50GB, and LVM knows it, but that space is sitting in a 
# "spare pool" (the Volume Group). This command takes 100% of that FREE space 
# in the pool and gives it specifically to your Root Logical Volume (rootVol).
sudo lvextend -L +10G /dev/mapper/RootVG-homeVol
sudo lvextend -L +10G /dev/mapper/RootVG-rootVol
sudo lvextend -L +10G /dev/mapper/RootVG-varVol

# This command tells the XFS filesystem to expand and occupy 
# all the new space available in the Logical Volume.
sudo xfs_growfs /
sudo xfs_growfs /home
sudo xfs_growfs /var
sleep 10
# --- 2. INSTALL TOOLS ---
sudo dnf install git -y
sleep 5
# ---- Install Java --#
sudo dnf install fontconfig java-21-openjdk -y
sleep 5
# Install npm in agent
sudo dnf module disable nodejs -y
sudo dnf module enable nodejs:20 -y
sudo dnf install nodejs -y
sleep 5

# Install Docker in agent
sudo dnf -y install dnf-plugins-core
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y
sudo systemctl start docker
sudo systemctl enable docker
sleep 5
usermod -aG docker ec2-user
sleep 5
# INSTALL TRIVY 
sudo curl -sfL https://raw.githubusercontent.com/aquasecurity/trivy/main/contrib/install.sh | sh -s -- -b /usr/local/bin v0.70.0