# 📝 Daily Task Logger (Bash Script)

A simple and interactive Bash script that logs your daily tasks with timestamps — saved automatically into a date-based `.log` file in your `~/task_logs` folder.

## 🚀 Features

- 🕒 Timestamped tasks
- 📁 Daily log files created automatically
- ❌ Exit anytime with `exit`
- 🧠 Easy to use in the terminal
- 🔒 Keeps logs private (saved to your home directory)

## 📦 How to Use

1. Clone the repo:

   git clone https://github.com/TechWithHer/Daily-Task-Logger.git
   cd Daily-Task-Logger
   chmod +x task_logger.sh
2. Run the script:
./task_logger.sh
3. View logs:
cat ~/task_logs/YYYY-MM-DD.log


Example Output:

[09:45:12] Completed morning stand-up
[10:30:05] Wrote daily shell script

Type exit anytime to finish logging for the day.

##Learning Goals
This project teaches:
read, echo, if, while, date, file I/O
Bash basics: scripting, permissions, logic
CLI app development from scratch

