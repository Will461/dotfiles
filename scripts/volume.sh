#!/bin/sh

update_volume() {
    current_volume=$(pactl get-sink-volume @DEFAULT_SINK@ | grep -Po '\d+%' | head -1 | tr -d '%')
    increment=10

    new_volume=$(echo "$current_volume + $1 * $increment" | bc)

    if [ "$new_volume" -lt 0 ]; then
        new_volume=0
    elif [ "$new_volume" -gt 100 ]; then
        new_volume=100
    fi

    pactl set-sink-volume @DEFAULT_SINK@ "${new_volume}%"
}

if [ "$#" -ne 1 ] || { [ "$1" -ne 1 ] && [ "$1" -ne -1 ]; } ; then
    echo "Usage: $0 <1|-1>"
    exit 1
fi

update_volume "$1"
