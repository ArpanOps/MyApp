#!/bin/bash

# Create the systemd service file
sudo tee /etc/systemd/system/myapp.service > /dev/null <<EOF
[Unit]
Description=My Node.js App
After=network.target

[Service]
User=ec2-user
WorkingDirectory=/home/ec2-user/app
ExecStart=/usr/bin/node index.js
Restart=always
Environment=NODE_ENV=production

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd to recognize the new service
sudo systemctl daemon-reload

# Enable the service to start on boot
sudo systemctl enable myapp

# Start the service
sudo systemctl start myapp
