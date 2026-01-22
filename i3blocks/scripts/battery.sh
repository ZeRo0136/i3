#!/bin/bash
capacity=$(cat /sys/class/power_supply/BAT0/capacity 2>/dev/null)

if [ -z "$capacity" ]; then
    echo "N/A"
elif [ "$capacity" -ge 100 ]; then
    echo "<span color='#00FF00'>󰁹</span> ${capacity}% "
elif [ "$capacity" -ge 90 ]; then
    echo "<span color='#00FF00'>󰂂</span> ${capacity}% "
elif [ "$capacity" -ge 80 ]; then
    echo "<span color='#00FF00'>󰂁</span> ${capacity}% "
elif [ "$capacity" -ge 70 ]; then
    echo "<span color='#00FF00'>󰂀</span> ${capacity}% "
elif [ "$capacity" -ge 60 ]; then
    echo "<span color='#00FF00'>󰁿</span> ${capacity}% "
elif [ "$capacity" -ge 50 ]; then
    echo "<span color='#00FF00'>󰁾</span> ${capacity}% "
elif [ "$capacity" -ge 40 ]; then
    echo "<span color='#00FF00'>󰁽</span> ${capacity}% "
elif [ "$capacity" -ge 30 ]; then
    echo "<span color='#FFFF00'>󰁼</span> ${capacity}% "
elif [ "$capacity" -ge 20 ]; then
    echo "<span color='#FFFF00'>󰁻</span> ${capacity}% "
elif [ "$capacity" -ge 10 ]; then 
    echo "<span color='#FF0000'>󰁺</span> ${capacity}% "
fi
