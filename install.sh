#!/bin/bash

set -e

CHEAT_CONFIG_DIR="${HOME}/.config/cheat"
CHEAT_SHEETS_DIR="${CHEAT_CONFIG_DIR}/cheatsheets"
INSTALL_DIR="${CHEAT_SHEETS_DIR}/davidpangsw"
CONF_FILE="${CHEAT_CONFIG_DIR}/conf.yml"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DATE=$(date +%Y%m%d)

# Check prerequisites
command -v yq >/dev/null 2>&1 || { echo "Error: yq is required. Install: brew install yq"; exit 1; }
command -v cheat >/dev/null 2>&1 || { echo "Error: cheat is required. Install from https://github.com/cheat/cheat"; exit 1; }
[ -f "${CONF_FILE}" ] || { echo "Error: ${CONF_FILE} not found. Run: cheat --init"; exit 1; }
[ -d "${SCRIPT_DIR}/cheatsheets/davidpangsw" ] || { echo "Error: cheatsheets/davidpangsw directory not found"; exit 1; }

# Copy cheatsheets
mkdir -p "${CHEAT_SHEETS_DIR}"
echo "Created/Updated: ${INSTALL_DIR}/"
cp -r "${SCRIPT_DIR}/cheatsheets/davidpangsw" "${CHEAT_SHEETS_DIR}/"

# Backup and update config
BACKUP_FILE="${CHEAT_CONFIG_DIR}/conf.${BACKUP_DATE}bak.yml"
cp "${CONF_FILE}" "${BACKUP_FILE}"
echo "Created: ${BACKUP_FILE}"

# Remove old entries and add new ones
yq e "del(.cheatpaths[] | select(.name == \"davidpangsw-0\" or .name == \"davidpangsw-1\"))" -i "${CONF_FILE}"
yq e ".cheatpaths += [{\"name\": \"davidpangsw-0\", \"path\": \"${INSTALL_DIR}/0\", \"tags\": [\"davidpangsw\"], \"readonly\": false}]" -i "${CONF_FILE}"
yq e ".cheatpaths += [{\"name\": \"davidpangsw-1\", \"path\": \"${INSTALL_DIR}/1\", \"tags\": [\"davidpangsw\"], \"readonly\": false}]" -i "${CONF_FILE}"
echo "Edited: ${CONF_FILE}"

echo ""
echo "Done. Verify with: cheat -t davidpangsw"
