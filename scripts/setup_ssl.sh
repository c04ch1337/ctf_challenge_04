#!/bin/bash
# Configure vulnerable SSL
echo "Setting up vulnerable SSL..."
openssl req -x509 -newkey rsa:2048 -keyout /etc/ssl/private/key.pem -out /etc/ssl/certs/cert.pem -days 365 -nodes -subj "/CN=localhost"
echo "Flag 6: CTF{weak_ssl_config}" > /var/www/html/flag6.txt
