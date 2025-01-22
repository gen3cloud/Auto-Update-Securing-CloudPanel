#!/bin/bash
LOG_FILE="/var/log/clp-update.log"

echo "Iniciando clp-update em $(date)" >> "$LOG_FILE"
sudo clp-update >> "$LOG_FILE" 2>&1
echo "clp-update concluído em $(date)" >> "$LOG_FILE"
