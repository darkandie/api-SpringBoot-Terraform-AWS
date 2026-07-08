#!/bin/bash
yum update -y
yum install -y docker
systemctl enable --now docker
usermod -aG docker ec2-user

docker run -d --restart unless-stopped -p 80:8080 darkandie/public-api:latest