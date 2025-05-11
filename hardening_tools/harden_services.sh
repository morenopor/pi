#!/bin/bash

# This script automates checking and hardening system services.

# Step 1: Prepare the environment and variables

# Set variables
LOG_FILE="/var/log/service_hardening.log"
DATE=$(date +"%Y-%m-%d %H:%M:%S")

# Ensure the log file exists
touch "$LOG_FILE"

# Function to log messages
log_message() {
    echo "$DATE - $1" >> "$LOG_FILE"
    echo "$DATE - $1"
}

# Function to perform systemd-analyze security and suggest hardening
harden_service() {
    local service_name="$1"
    log_message "Checking security score for service: $service_name"
    
    # Perform the security analysis
    output=$(systemd-analyze security "$service_name")
    echo "$output" >> "$LOG_FILE"
    
    # Basic check (replace with your criteria)
    if grep -q "INSECURE" <<< "$output" || grep -q "EXPOSED" <<< "$output"; then
        log_message "Service $service_name is not adequately hardened. Review output and apply hardening."
        log_message "Example: systemctl edit --full $service_name"
    else
        log_message "Service $service_name has an acceptable security score."
    fi
}

# Step 2: Main script logic

log_message "Starting system service hardening check"

# List of services to check (adjust as needed)
services=(
    "ModemManager.service"
    "NetworkManager.service"
    "cron.service"
    "sshd.service"
    # Add other services as needed
)

# Loop through each service and perform hardening check
for service in "${services[@]}"; do
    harden_service "$service"
done

log_message "System service hardening check completed. Review $LOG_FILE for details."
