#!/bin/bash

# Get primary display
DISPLAY_NAME=$(xrandr | grep " connected primary" | awk '{print $1}')
[ -z "$DISPLAY_NAME" ] && DISPLAY_NAME=$(xrandr | grep " connected" | head -1 | awk '{print $1}')

case "$1" in
    up)
        xrandr --output "$DISPLAY_NAME" --brightness $(echo "$(xrandr --verbose | grep -i brightness | head -1 | awk '{print $2}') + 0.1" | bc)
        ;;
    down)
        xrandr --output "$DISPLAY_NAME" --brightness $(echo "$(xrandr --verbose | grep -i brightness | head -1 | awk '{print $2}') - 0.1" | bc)
        ;;
    set)
        xrandr --output "$DISPLAY_NAME" --brightness "$2"
        ;;
esac

# Update i3blocks
pkill -SIGRTMIN+3 i3blocks
