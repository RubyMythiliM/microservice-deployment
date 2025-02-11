#!/bin/bash

echo "Updating and installing dependencies..."
sudo apt update -y && sudo apt upgrade -y
sudo apt install -y nodejs npm docker.io nginx git

echo "Setting up microservice environment..."
git clone https://github.com/RubyMythiliM/microservice-deployment.git /opt/microservice-app
cd /opt/microservice-app
npm install

echo "Configuring NGINX..."
sudo cp nginx_config.conf /etc/nginx/sites-available/default
sudo systemctl restart nginx

echo "Setup complete!"
