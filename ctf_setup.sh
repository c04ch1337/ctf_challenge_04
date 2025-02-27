#!/bin/bash

# Build and run the CTF challenge server
echo "Building Docker image..."
docker-compose build

echo "Starting CTF challenge server..."
docker-compose up -d

echo "CTF challenge server is running:"
echo "Web: http://localhost:84"
echo "SSH: ssh ctf@localhost -p 2222"
echo "HTTPS: https://localhost:8443"
