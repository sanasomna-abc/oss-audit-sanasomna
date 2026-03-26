#!/bin/bash
# Script 1: System Identity Report
# Author: [Your Name]

# Variables
DISTRO=$(hostnamectl | grep "Operating System" | cut -d: -f2)
KERNEL=$(uname -r)
USER_NAME=$(whoami)
UPTIME=$(uptime -p)
DATE_NOW=$(date)

echo "=========================================="
echo "    SYSTEM IDENTITY AUDIT - PYTHON"
echo "=========================================="
echo "Date/Time : $DATE_NOW"
echo "Distro    :$DISTRO"
echo "Kernel    : $KERNEL"
echo "Current User: $USER_NAME"
echo "Uptime    : $UPTIME"
echo "------------------------------------------"
echo "OS License Note: This system runs on the Linux Kernel,"
echo "which is protected by the GNU GPL v2 License."
echo "=========================================="