#!/bin/bash

xtitle -s -f '%u\n' | while read -r focused_wid; do
    # Get unique visible windows
    all_windows=$(xdotool search --onlyvisible --class "" 2>/dev/null | sort -u)
    
    output=""
    
    for wid in $all_windows; do
         content=$(xprop -id "$wid" WM_CLASS _NET_WM_NAME | awk '/WM_CLASS/{match($0,/"[^"]+", "([^"]+)"/,c)} /_NET_WM_NAME/{match($0,/"(.+)"/,n); print c[1]":"n[1]}')
         # Split into class and name
         wm_class=$(echo "$content" | cut -d: -f1)
         wm_name=$(echo "$content" | cut -d: -f2-)        
        # Skip empty class names
        [[ -z "$wm_class" ]] && continue
        [[ "$wm_class" =~ ^(i3-frame|i3bar)$ ]] && continue
        
        # Firefox-specific filter: only show NORMAL windows
        if [ "$wm_class" = "Firefox" ]; then
            window_type=$(xprop -id "$wid" WM_WINDOW_ROLE 2>/dev/null)
            if ! echo "$window_type" | grep -q "browser"; then
                continue
            fi
        fi

        if [ "$wid" = "$focused_wid" ]; then
            output="$output<span weight='heavy' background='#7193ad' foreground='#030303'>$wm_class</span> <span weight='normal'>$wm_name</span>"
        else
            output="$output<span foreground='#888888'>$wm_class</span> "
        fi
    done
    
    echo "$output"
done
