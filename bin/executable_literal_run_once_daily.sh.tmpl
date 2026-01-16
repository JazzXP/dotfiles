#!/bin/zsh

# Set the path to the timestamp file (e.g., in your home directory)
TIMESTAMP_FILE="$HOME/.local/state/.script_last_run"

# Get today's date
TODAY=$(date +%Y-%m-%d)

# Check if the timestamp file exists and is from today
if [[ -f "$TIMESTAMP_FILE" && $(cat "$TIMESTAMP_FILE") == "$TODAY" ]]; then
  # Script has already run today, so exit
  exit 0
fi

# Update the timestamp file with today's date
echo "$TODAY" >"$TIMESTAMP_FILE"

# Place the commands you want to run once per day here
fastfetch
chezmoi update

