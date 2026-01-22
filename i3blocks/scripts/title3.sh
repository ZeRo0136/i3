#!/bin/bash

xtitle -s -f '%u\n' | while read -r wid; do
    # Get window class and name
    output=$(xprop -id "$wid" WM_CLASS _NET_WM_NAME | awk '/WM_CLASS/{match($0,/"[^"]+", "([^"]+)"/,c)} /_NET_WM_NAME/{match($0,/"(.+)"/,n); print c[1]":"n[1]}')
    
    # Split into class and name
    wm_class=$(echo "$output" | cut -d: -f1)
    wm_name=$(echo "$output" | cut -d: -f2-)
    
    # Truncate window name if too long
    max_length=60
    if [ ${#wm_name} -gt $max_length ]; then
        wm_name="${wm_name:0:$max_length}..."
    fi
    
    # Output with styling
    echo "<span font_family='Terminess Nerd Font' size='large' weight='bold'>$wm_class: $wm_name</span>"
done

