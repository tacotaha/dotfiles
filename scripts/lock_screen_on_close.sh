#!/usr/bin/env bash

# Checks to see if the lid is closed and locks the screen accordingly 

while true
do
	if [[ $(< /proc/acpi/button/lid/LID/state) = *closed ]]
	then
		logger Lid closed
		case $(< /sys/class/power_supply/AC/online) in
			1)  ( [[ ! "$(pidof slock)" ]] && slock ) ;;
			0) logger "suspending..."; systemctl suspend ;;
		esac
	fi
	sleep 2
done 
