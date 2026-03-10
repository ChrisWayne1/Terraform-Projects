#!/bin/bash

# Log user data execution
exec > /var/log/user-data.log 2>&1

echo "Starting EC2 bootstrap..."

# Update system
yum update -y

# Install nginx
amazon-linux-extras install nginx1 -y
systemctl enable nginx
systemctl start nginx

# Install Docker
yum install -y docker
systemctl start docker
systemctl enable docker

# Add ec2-user to docker group
usermod -aG docker ec2-user

# Create a simple web page
echo "<h1>Terraform EC2 Deployment Successful</h1>" > /usr/share/nginx/html/index.html

echo "Bootstrap complete!"