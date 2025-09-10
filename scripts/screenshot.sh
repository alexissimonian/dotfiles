#!/bin/bash

# Default to clipboard
SAVE=false

# Check for --save argument
if [[ "$1" == "--save" ]]; then
  SAVE=true
fi

# Temp file for the screenshot
TMP_IMG="/tmp/screenshot_annotate_$(date +%s).png"

# Select region and take screenshot
grim -g "$(slurp)" "$TMP_IMG"

# Annotate
swappy -f "$TMP_IMG"

# After swappy, it saves the edited image to the same file
if [ "$SAVE" = true ]; then
  mkdir -p "/home/alexis/Pictures/Screenshots"
  DEST="/home/alexis/Pictures/Screenshots/annotated_$(date +%Y-%m-%d_%H-%M-%S).png"
  cp "$TMP_IMG" "$DEST"
  notify-send "Screenshot saved to $DEST"
else
  wl-copy < "$TMP_IMG"
  notify-send "Screenshot copied to clipboard"
fi

# Cleanup
rm "$TMP_IMG"

