#!/bin/bash
# Script 4: Log File Analyzer
# Usage: ./log_analyzer.sh /var/log/syslog python
# Author: [Your Name]

LOGFILE=$1
KEYWORD=${2:-"python"} # Defaults to 'python' if no second argument is given
COUNT=0

# Check if a log file was provided as an argument
if [ -z "$LOGFILE" ]; then
    echo "Usage: $0 [path_to_log_file] [keyword]"
    echo "Example: ./log_analyzer.sh /var/log/syslog error"
    exit 1
fi

# Check if the file exists
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File $LOGFILE not found."
    exit 1
fi

echo "Scanning $LOGFILE for keyword: '$KEYWORD'..."
echo "------------------------------------------"

# While-read loop to process the file line-by-line
while IFS= read -r LINE; do
    if echo "$LINE" | grep -iq "$KEYWORD"; then
        COUNT=$((COUNT + 1))
        # Print only the last 5 matches to keep output clean
        LAST_MATCHES=$(echo "$LINE")
    fi
done < "$LOGFILE"

echo "Analysis Complete."
echo "Keyword '$KEYWORD' found $COUNT times."

if [ $COUNT -gt 0 ]; then
    echo "------------------------------------------"
    echo "Recent occurrences (Last 5 lines):"
    grep -i "$KEYWORD" "$LOGFILE" | tail -n 5
fi

# Requirement: A do-while style check for empty files
if [ ! -s "$LOGFILE" ]; then
    echo "Warning: The log file is empty. Nothing to analyze."
fi