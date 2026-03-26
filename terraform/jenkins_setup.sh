#!/bin/bash
# Update packages
apt update -y

# Install required packages
apt install -y fontconfig wget gnupg openjdk-21-jre

# Create keyrings directory if it doesn't exist
mkdir -p /etc/apt/keyrings

# Add Jenkins key
wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

# Add Jenkins repo
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" \
  > /etc/apt/sources.list.d/jenkins.list

# Update package index
apt update -y

# Install Jenkins
apt install -y jenkins

# Start and enable Jenkins service
systemctl enable jenkins
systemctl start jenkins

# Optional: verify installation
java -version
systemctl status jenkins