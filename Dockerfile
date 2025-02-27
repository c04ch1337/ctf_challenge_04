# Dockerfile
FROM ubuntu:22.04

# Install dependencies
RUN apt-get update && \
    apt-get install -y apache2 php libapache2-mod-php curl openssh-server && \
    apt-get clean

# Copy web files
COPY web/ /var/www/html/

# Copy SSH files
COPY ssh/ /home/ctf/

# Copy setup scripts
COPY scripts/setup_app.sh /usr/local/bin/setup_app.sh
COPY scripts/setup_ssh.sh /usr/local/bin/setup_ssh.sh
COPY scripts/setup_ssl.sh /usr/local/bin/setup_ssl.sh
COPY scripts/setup_flags.sh /usr/local/bin/setup_flags.sh

# Set permissions
RUN chmod +x /usr/local/bin/setup_app.sh && \
    chmod +x /usr/local/bin/setup_ssh.sh && \
    chmod +x /usr/local/bin/setup_ssl.sh && \
    chmod +x /usr/local/bin/setup_flags.sh

# Expose ports (HTTP, SSH, HTTPS)
EXPOSE 80 22 443

# Run setup scripts
RUN /usr/local/bin/setup_app.sh && \
    /usr/local/bin/setup_ssh.sh && \
    /usr/local/bin/setup_ssl.sh && \
    /usr/local/bin/setup_flags.sh

# Start services
CMD service ssh start && apache2ctl -D FOREGROUND
