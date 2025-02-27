#!/bin/bash
# Configure vulnerable SSH
echo "Setting up vulnerable SSH..."
useradd -m -s /bin/bash ctf
echo "ctf:weakpassword" | chpasswd
echo "Flag 5: CTF{weak_ssh_credentials}" > /home/ctf/flag5.txt
