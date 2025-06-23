


#!/bin/bash
# Advanced Daily Task Logger with TUI

set -euo pipefail

# === CONFIG ===
LOG_DIR="/Users/apple/Desktop/TechWithHer/Daily-Task-Logger/log_directory"
mkdir -p "$LOG_DIR"
TODAY_LOG="$LOG_DIR/$(date +%Y-%m-%d).log"

# === COLORS ===
RED="\033[0;31m"
GREEN="\033[0;32m"
CYAN="\033[0;36m"
YELLOW="\033[1;33m"
NC="\033[0m" # No Color

# === FUNCTIONS ===

function banner() {
  echo -e "${CYAN}"
  echo "============================="
  echo "📝  Daily Task Logger"
  echo "============================="
  echo -e "${NC}"
}

function add_task() {
  echo -e "${CYAN}\n📂 Select a Category:${NC}"
  echo "1. Work"
  echo "2. Personal"
  echo "3. Study"
  echo "4. Other"
  read -rp "Enter choice [1-4]: " CATEGORY_CHOICE

  case $CATEGORY_CHOICE in
    1) CATEGORY="Work" ;;
    2) CATEGORY="Personal" ;;
    3) CATEGORY="Study" ;;
    4)
      read -rp "✏️  Enter custom category: " CUSTOM
      CATEGORY="${CUSTOM:-Other}"
      ;;
    *) 
      echo -e "${RED}❌ Invalid option. Defaulting to 'Misc'.${NC}"
      CATEGORY="Misc"
      ;;
  esac

  read -rp "📝 Enter Task: " TASK

  if [[ -z "$TASK" ]]; then
    echo -e "${RED}❌ Task cannot be empty.${NC}"
    return
  fi

  TIMESTAMP=$(date +%H:%M:%S)
  echo "[$TIMESTAMP][$CATEGORY] $TASK" >> "$TODAY_LOG"
  echo -e "${GREEN}✔ Task saved under [$CATEGORY].${NC}"
}



function view_today_log() {
  echo -e "${YELLOW}\n📖 Today's Log: $TODAY_LOG${NC}"
  if [[ -s "$TODAY_LOG" ]]; then
    cat "$TODAY_LOG"
  else
    echo -e "${RED}No tasks logged yet today.${NC}"
  fi
}

function show_menu() {
  banner
  echo "1️⃣  Add New Task"
  echo "2️⃣  View Today's Log"
  echo "3️⃣  Exit"
  echo ""
  read -rp "Select an option [1-3]: " CHOICE

  case $CHOICE in
    1) add_task ;;
    2) view_today_log ;;
    3) echo -e "${CYAN}👋 Exiting. Have a productive day!${NC}"; exit 0 ;;
    *) echo -e "${RED}Invalid choice. Try again.${NC}" ;;
  esac
}

# === MAIN LOOP ===
while true; do
  show_menu
  echo ""
done
