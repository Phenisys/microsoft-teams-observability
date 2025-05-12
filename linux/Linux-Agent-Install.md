# MS Teams Observability Agent - Linux Installation Guide

This guide explains how to install and configure the MS Teams Observability Agent as a systemd service on Linux distributions.

## Prerequisites

- Root or sudo access
- Systemd-based Linux distribution
- The following files:
  - `Agent_MSTeams` (the agent binary)
  - `config.yaml` (configuration file)
  - [msteams-observability-agent.service](msteams-observability-agent.service) (service file)
  - [install-agent.sh](install-agent.sh) (installation script)

## Installation Files

The installation process uses two main files:

1. [Service File](msteams-observability-agent.service): Defines how the agent runs as a systemd service
2. [Installation Script](install-agent.sh): Automates the installation process

## Installation Steps

1. **Prepare the Files**
   - Ensure you have all required files in the same directory
   - Make the installation script executable:
     ```bash
     chmod +x install-agent.sh
     ```

2. **Review Configuration**
   - Open `msteams-observability-agent.service` and verify:
     - Installation path (default: `/opt/phenisys`)
     - User configuration (default: `root`)
     - Path to the agent binary and config file

3. **Run the Installation**
   ```bash
   sudo ./install-agent.sh
   ```

   The script will:
   - Create the installation directory
   - Copy the agent files
   - Set appropriate permissions
   - Install and configure the systemd service
   - Enable and start the service

## Verification

After installation, verify the service status:
```bash
systemctl status msteams-observability-agent
```

## Service Management

Common service management commands:

```bash
# Start the service
sudo systemctl start msteams-observability-agent

# Stop the service
sudo systemctl stop msteams-observability-agent

# Restart the service
sudo systemctl restart msteams-observability-agent

# Check service status
sudo systemctl status msteams-observability-agent

# View service logs
sudo journalctl -u msteams-observability-agent
```

## Troubleshooting

If the service fails to start:

1. Check the service status:
   ```bash
   systemctl status msteams-observability-agent
   ```

2. View the service logs:
   ```bash
   journalctl -u msteams-observability-agent
   ```

3. Verify file permissions:
   ```bash
   ls -l /opt/phenisys/
   ```

4. Ensure the configuration file is valid:
   ```bash
   cat /opt/phenisys/config.yaml
   ```

## Uninstallation

To remove the service:

```bash
# Stop and disable the service
sudo systemctl stop msteams-observability-agent
sudo systemctl disable msteams-observability-agent

# Remove the service file
sudo rm /etc/systemd/system/msteams-observability-agent.service

# Reload systemd
sudo systemctl daemon-reload

# Optionally remove the installation directory
sudo rm -rf /opt/phenisys
```

## Notes

- The service is configured to restart automatically on failure
- Default installation path is `/opt/phenisys`
- The service starts after the network is available
- Logs are available through journalctl 