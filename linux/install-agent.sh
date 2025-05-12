#!/bin/bash

# Exit on error
set -e

# Configuration
INSTALL_DIR="/opt/phenisys"
SERVICE_NAME="msteams-observability-agent"
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"

# Check if running as root
if [ "$EUID" -ne 0 ]; then 
    echo "Please run as root"
    exit 1
fi

# Create installation directory
echo "Creating installation directory..."
mkdir -p ${INSTALL_DIR}

# Copy agent files
echo "Copying agent files..."
# Replace these paths with your actual source paths
cp Agent_MSTeams ${INSTALL_DIR}/
cp config.yaml ${INSTALL_DIR}/

# Set proper permissions
echo "Setting permissions..."
chmod +x ${INSTALL_DIR}/Agent_MSTeams
chmod 644 ${INSTALL_DIR}/config.yaml

# Install service file
echo "Installing service file..."
cp msteams-observability-agent.service ${SERVICE_FILE}

# Reload systemd
echo "Reloading systemd..."
systemctl daemon-reload

# Enable and start service
echo "Enabling and starting service..."
systemctl enable ${SERVICE_NAME}
systemctl start ${SERVICE_NAME}

echo "Installation completed successfully!"
echo "Service status:"
systemctl status ${SERVICE_NAME} 