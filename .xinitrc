#!/bin/sh

xbindkeys
pactl set-source-mute @DEFAULT_SOURCE@ 1
echo 0 > /sys/class/leds/platform::micmute/brightness
find /home/shared/wallpapers -type f | shuf -n 1 | xargs feh --bg-scale

notification_sent=false
while true; do
   current_date_time=$(date +"%F %R")
   battery_capacity=$(cat /sys/class/power_supply/BAT0/capacity)
   
   if [ "$battery_capacity" -lt 6 ]; then
         notify-send -u critical "Battery Low" "Battery level is ${battery_capacity}%"
   elif [ "$battery_capacity" -lt 16 ] && [ "$notification_sent" = false ]; then
	notify-send -u critical "Battery Low" "Battery level is ${battery_capacity}%"
        notification_sent=true
   elif [ "$battery_capacity" -gt 16 ]; then
      notification_sent=false
   fi

   xsetroot -name "$current_date_time | $battery_capacity%"
   sleep 1m
done &

picom &
dunst &
redshift &
exec dwm
