#!/bin/bash

# Get primary display
DISPLAY_NAME=$(xrandr | grep " connected primary" | awk '{print $1}')
[ -z "$DISPLAY_NAME" ] && DISPLAY_NAME=$(xrandr | grep " connected" | head -1 | awk '{print $1}')

# Get current brightness (0.0 to 1.0)
current=$(xrandr --verbose | grep -i brightness | head -1 | awk '{print $2}')

# Convert to percentage
percentage=$(echo "$current * 100 / 1" | bc)

# Display with yellow icon
# echo "<span background='#f3be7c' foreground='#1a253a'> 󰃟 </span> ${percentage}%"
# echo "" ${percentage}%" "
echo "<span weight='bold' style='italic'> ${percentage}% </span>"
