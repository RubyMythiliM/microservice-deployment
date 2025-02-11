#!/bin/bash

echo "Starting Microservice..."
cd /opt/microservice-app
nohup node server.js &
echo "Microservice started successfully!"
