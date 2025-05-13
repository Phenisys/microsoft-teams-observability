#!/usr/bin/env bash
set -Eeuo pipefail

###############################################################################
# Usage / CLI options
###############################################################################
usage() {
  cat <<EOF
Usage: $0 [-f /path/to/local/binary]

  -f FILE   Provide a local agent binary instead of downloading it.
  -h        Show this help.

Examples:
  $0                # run online install
  $0 -f ./Agent_MSTeams_ubuntu_2204_x64   # use local binary
EOF
}

LOCAL_BINARY=""
while getopts ":f:h" opt; do
  case "$opt" in
    f) LOCAL_BINARY="$OPTARG" ;;
    h) usage; exit 0 ;;
    ?) echo "Unknown option -$OPTARG" >&2; usage; exit 1 ;;
  esac
done

###############################################################################
# Must be executed as root
###############################################################################
if [[ "${EUID}" -ne 0 ]]; then
  echo "ERROR: this installer must be run as root (use sudo or log in as root)." >&2
  exit 1
fi

###############################################################################
# PRE‑REQUISITE: ensure systemd is available
###############################################################################
if ! command -v systemctl &>/dev/null; then
  echo "ERROR: systemctl not found. This host doesn't use systemd." >&2
  exit 1
fi
echo "✔ systemctl detected – proceeding with installation."

###############################################################################
# Variables
###############################################################################
AGENT_DIR="/opt/ms-teams-observability-agent"
AGENT_BIN="${AGENT_DIR}/ms-teams-observability-agent"
AGENT_URL="https://github.com/Phenisys/microsoft-teams-observability/releases/download/agent/Agent_MSTeams_ubuntu_2204_x64"

CONFIG_FILE="${AGENT_DIR}/config.yaml"
LICENSE_FILE="${AGENT_DIR}/license.lic"
UNIT_FILE="/lib/systemd/system/ms-teams-observability-agent.service"
UNIT_NAME="ms-teams-observability-agent.service"

###############################################################################
# 1. Create agent directory
###############################################################################
echo -e "\n[1/9] Creating agent directory ${AGENT_DIR} ..."
mkdir -p "${AGENT_DIR}"
echo "✓ Directory created."

###############################################################################
# 2. Obtain agent binary
###############################################################################
echo -e "\n[2/9] Obtaining agent binary ..."
if [[ -n "${LOCAL_BINARY}" ]]; then
  echo "→ Using local file: ${LOCAL_BINARY}"
  if [[ ! -r "${LOCAL_BINARY}" ]]; then
    echo "ERROR: '${LOCAL_BINARY}' is not readable or doesn't exist." >&2
    exit 1
  fi
  cp "${LOCAL_BINARY}" "${AGENT_BIN}"
else
  echo "→ Downloading from ${AGENT_URL}"
  if ! wget -q "${AGENT_URL}" -O "${AGENT_BIN}"; then
    echo "ERROR: download failed." >&2
    echo "You can rerun the script with a local binary via:" >&2
    echo "  $0 -f /path/to/Agent_MSTeams_ubuntu_2204_x64" >&2
    exit 1
  fi
fi
chmod 0750 "${AGENT_BIN}"
echo "✓ Binary ready at ${AGENT_BIN}."

###############################################################################
# 3. Create dedicated group and user
###############################################################################
echo -e "\n[3/9] Ensuring system user 'ms-teams-observability-agent' exists ..."
if ! id -u ms-teams-observability-agent &>/dev/null; then
  useradd -r -U ms-teams-observability-agent
  echo "✓ User & Group created."
else
  echo "✓ User already present."
fi

###############################################################################
# 4. Generate sample configuration file
###############################################################################
echo -e "\n[4/9] Writing sample configuration to ${CONFIG_FILE} ..."
tee "${CONFIG_FILE}" >/dev/null <<'EOF'
microsoft_authentication:
    microsoft_tenant_id: your_tenant_id
    microsoft_client_id: your_client_id
    microsoft_client_secret: your_client_secret
    microsoft_scope: https://graph.microsoft.com/.default
    microsoft_grant_type: client_credentials

output:
    dynatrace:
        dynatrace_tenant_id: your_tenant_id
        dynatrace_api_token: your_token
    splunk:
        splunk_hec_url: https://mysplunk:8088/services/collector/event
        splunk_hec_token: hec_token
        splunk_ssl_check: false

collection_config:
    logging_services: [dynatrace, splunk]
    microsoft_max_call_duration_hours: 5
    logfile_log_level: INFO
    license_file: ./license.lic
    interval_collection_minutes: 1
    enabled_features:
        - ms_teams_calls_collection
        - ms_teams_issues_collection
        - ms_teams_pstn_calls_collection
        - ms_teams_direct_routing_calls_collection
EOF
echo "✓ Configuration file created (edit with real values)."

###############################################################################
# 5. Create (empty) license file
###############################################################################
echo -e "\n[5/9] Creating empty license file ..."
touch "${LICENSE_FILE}"
echo "✓ License file create (edit with real values)."

###############################################################################
# 6. Set permissions and ownership
###############################################################################
echo -e "\n[6/9] Setting file ownership and permissions ..."
chown -R ms-teams-observability-agent:ms-teams-observability-agent "${AGENT_DIR}"
chmod 0660 "${AGENT_DIR}"/*
chmod 0700 "${AGENT_BIN}"
echo "✓ Permissions applied."

###############################################################################
# 7. Create systemd unit file
###############################################################################
echo -e "\n[7/9] Creating systemd unit ${UNIT_FILE} ..."
tee "${UNIT_FILE}" >/dev/null <<EOF
[Unit]
Description=Phenisys Microsoft Teams Observability Agent
After=network.target

[Service]
Type=simple
User=ms-teams-observability-agent
Group=ms-teams-observability-agent
WorkingDirectory=${AGENT_DIR}
ExecStart=${AGENT_BIN} --config "./config.yaml"
Restart=always
RestartSec=60s
StandardOutput=journal
StandardError=journal

[Install]
WantedBy=multi-user.target
EOF
echo "✓ Unit file created."

###############################################################################
# 8. Enable and start the service
###############################################################################
echo -e "\n[8/9] Enabling and starting the service ..."
systemctl daemon-reload
systemctl enable --now "${UNIT_NAME}"
echo "✓ Service enabled and started."

###############################################################################
# 9. Show status
###############################################################################
echo -e "\n[9/9] Current service status:"
sleep 5
systemctl status --no-pager "${UNIT_NAME}"

echo -e "\nInstallation complete. View logs with:"
echo "  journalctl -u ${UNIT_NAME} -f"
