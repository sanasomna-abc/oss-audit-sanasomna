#!/bin/bash
# Script 5: Open Source Manifesto Generator
# Author: [Your Name] | Course: Open Source Software

echo "------------------------------------------"
echo "  OPEN SOURCE PHILOSOPHY GENERATOR"
echo "------------------------------------------"
echo "Answer three questions to generate your manifesto."
echo ""

# Taking user input
read -p "1. Name one open-source tool you use every day: " TOOL
read -p "2. In one word, what does 'software freedom' mean to you? " FREEDOM
read -p "3. Name one thing you would build and share freely: " BUILD

DATE=$(date '+%d %B %Y')
USER_NAME=$(whoami)
OUTPUT="manifesto_${USER_NAME}.txt"

# Composing the paragraph
{
    echo "=========================================="
    echo "       THE OPEN SOURCE MANIFESTO"
    echo "=========================================="
    echo "Generated on: $DATE"
    echo "Author      : $USER_NAME"
    echo ""
    echo "I believe that tools like $TOOL are the foundation of modern"
    echo "innovation. To me, the essence of open source is '$FREEDOM'."
    echo "In the spirit of community and transparency, I commit to"
    echo "building $BUILD and sharing it freely with the world."
    echo ""
    echo "Signed,"
    echo "$USER_NAME"
    echo "=========================================="
} > "$OUTPUT"

echo ""
echo "[SUCCESS] Your personalized manifesto has been saved to: $OUTPUT"
echo "Displaying your manifesto below:"
echo "------------------------------------------"
cat "$OUTPUT"