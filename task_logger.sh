#!/bin/bash
# Daily Task Logger
# Save timestamped tasks to a log file named by date

set -euo pipefail

LOG_DIR="/Users/apple/Desktop/TechWithHer/Daily-Task-Logger/log_directory"
mkdir -p "$LOG_DIR"

LOG_FILE="$LOG_DIR/$(date +%Y-%m-%d).log"

echo "📝 Daily Task Logger Started"
echo "Enter your task and press [Enter]. Type 'exit' to finish."

while true; do
    read -rp "➤ Task: " TASK

    if [[ "$TASK" == "exit" ]]; then
        echo "✅ Logging finished for today. File saved to: $LOG_FILE"
        break
    fi

    if [[ -z "$TASK" ]]; then
        echo "⚠️  Please enter something or type 'exit'."
        continue
    fi

    TIMESTAMP=$(date +%H:%M:%S)
    echo "[$TIMESTAMP] $TASK" >> "$LOG_FILE"
    echo "✔️  Task saved."
done
