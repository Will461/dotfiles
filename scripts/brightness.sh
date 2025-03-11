#!/bin/sh

update_brightness() {
    current_brightness=$(cat /sys/class/backlight/intel_backlight/brightness)
    increment=606

    new_brightness=$(echo "$current_brightness + $1 * $increment" | bc)

    if [ "$new_brightness" -lt 0 ]; then
        new_brightness=0
    elif [ "$new_brightness" -gt 24242 ]; then
        new_brightness=24242
    fi

    echo "$new_brightness" > /sys/class/backlight/intel_backlight/brightness
}

if [ "$#" -ne 1 ] || { [ "$1" -ne 1 ] && [ "$1" -ne -1 ]; } ; then
    echo "Usage: $0 <1|-1>"
    exit 1
fi

update_brightness "$1"
