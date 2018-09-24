#!/usr/bin/env bash

while true; do
    battery_level=`acpi -b | grep -P -o '[0-9]+(?=%)'`
    charging=`acpi | awk '{print $3}'`
    if [ $battery_level -le 10 ] && [ $charging == "Discharging," ]
    then
        notify-send "Battery low" "Battery level is ${battery_level}%!"
    fi
    sleep 60
done
