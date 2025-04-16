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

# Reload systemd to pick up new service
sudo systemctl daemon-reexec
sudo systemctl daemon-reload

# Enable service to start on boot
sudo systemctl enable myapp

# Restart the app
sudo systemctl restart myapp
