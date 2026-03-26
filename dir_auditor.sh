#!/bin/bash
# Script 3: Disk and Permission Auditor
# Author: [Your Name]

# List of important Python-related directories
DIRS=("/usr/bin/python3" "/usr/lib/python3" "/etc/python3" "/usr/local/lib/python3.10")

echo "------------------------------------------"
echo "  PYTHON DIRECTORY & PERMISSION AUDIT"
echo "------------------------------------------"

# Loop through the directories
for DIR in "${DIRS[@]}"; do
    if [ -e "$DIR" ]; then
        # Extract Permissions, Owner, and Group using awk
        PERMS=$(ls -ld "$DIR" | awk '{print $1}')
        OWNER=$(ls -ld "$DIR" | awk '{print $3}')
        
        # Get directory size
        SIZE=$(du -sh "$DIR" 2>/dev/null | cut -f1)
        
        echo "Location: $DIR"
        echo "  - Permissions: $PERMS"
        echo "  - Owner      : $OWNER"
        echo "  - Disk Usage : $SIZE"
    else
        echo "Location: $DIR => [NOT FOUND on this system]"
    fi
    echo ""
done

# Specific check for Python config
echo "Checking security of /etc/python3..."
if [ -d "/etc/python3" ]; then
    ls -ld /etc/python3
else
    echo "Default config directory not found."
