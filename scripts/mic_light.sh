#!/bin/sh

MUTE_STATUS=$(pactl get-source-mute @DEFAULT_SOURCE@ | awk '{print $2}')

if [ "$MUTE_STATUS" = "yes" ]; then
    pactl set-source-mute @DEFAULT_SOURCE@ 0
    echo 1 > /sys/class/leds/platform::micmute/brightness
else
    pactl set-source-mute @DEFAULT_SOURCE@ 1
    echo 0 > /sys/class/leds/platform::micmute/brightness
fi
