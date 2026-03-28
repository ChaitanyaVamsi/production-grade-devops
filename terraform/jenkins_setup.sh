#!/bin/bash
set -e

# Update packages
apt-get update -y

# Install required packages
apt-get install -y fontconfig openjdk-21-jre wget

# Create keyrings directory
mkdir -p /etc/apt/keyrings

# Add Jenkins key
wget -O /etc/apt/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2026.key

# Add Jenkins repo
echo "deb [signed-by=/etc/apt/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" \
  > /etc/apt/sources.list.d/jenkins.list

# Update again
apt-get update -y

# Install Jenkins
apt-get install -y jenkins

# Start and enable Jenkins
systemctl enable jenkins
systemctl start jenkins