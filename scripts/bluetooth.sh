#!/bin/sh

STATUS=$(systemctl is-active bluetooth.service)

if [ "$STATUS" = "active" ]; then
    sudo systemctl stop bluetooth.service
    sudo rfkill block bluetooth
    notify-send -u low "Bluetooth" "Disabled"
else
    sudo systemctl start bluetooth.service
    sudo rfkill unblock bluetooth
    notify-send -u low "Bluetooth" "Enabled"
fi
