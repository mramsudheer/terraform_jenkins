#!/bin/bash
export PATH=$PATH:/usr/local/bin
# --- 1. INSTALL TOOLS ---
sudo dnf install git -y

# # Install ansible
# sudo dnf install ansible -y
# pip3.9 install netaddr
# pip3 install boto3 botocore

# Install terraform
sudo dnf config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo dnf -y install terraform

# --- 3. FIXED AWS CLI INSTALLATION ---
# Corrected URL: awscli.amazonaws.com
# curl "https://amazonaws.com" -o "awscliv2.zip"
# sudo dnf install unzip -y
# unzip awscliv2.zip
# sudo ./aws/install
# sudo ln -s /usr/local/bin/aws /usr/bin/aws

#----4. Install Jenkins ---#
sudo curl -o /etc/yum.repos.d/jenkins.repo     https://pkg.jenkins.io/rpm-stable/jenkins.repo
sudo dnf install fontconfig java-21-openjdk -y
sudo dnf install jenkins -y
sudo systemctl daemon-reload
sudo systemctl enable jenkins
sudo systemctl restart jenkins