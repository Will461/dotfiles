#!/bin/bash

WIFI_STATUS=$(nmcli radio wifi)

if [ "$WIFI_STATUS" = "enabled" ]; then
    nmcli radio wifi off
    notify-send -u low "WiFi" "WiFi disabled"
else
    nmcli radio wifi on
    notify-send -u low "WiFi" "WiFi enabled"
fi
