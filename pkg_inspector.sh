#!/bin/bash
# Script 2: FOSS Package Inspector
# Author: [Your Name]

PACKAGE="python3"

echo "Checking package status for: $PACKAGE"

# Check if package is installed (Works for Ubuntu/Debian)
if dpkg -l | grep -q "^ii  $PACKAGE"; then
    VERSION=$(python3 --version)
    echo "[SUCCESS] $PACKAGE is installed."
    echo "System Version: $VERSION"
else
    echo "[ERROR] $PACKAGE is NOT installed."
    exit 1
fi

echo "------------------------------------------"
# Case statement to provide a philosophy note
case $PACKAGE in
    python3)
        echo "Philosophy: Python emphasizes code readability and 'The Zen of Python'."
        echo "It is the primary 'Glue' language for Linux automation."
        ;;
    gcc)
        echo "Philosophy: The GNU Compiler Collection is the bedrock of Free Software."
        ;;
    *)
        echo "Philosophy: Generic Open Source component."
        ;;
esac
echo "------------------------------------------"