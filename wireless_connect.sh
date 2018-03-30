#!/bin/bash

# Get wireless card up and running
sudo ifconfig wlp4s0 up

# Scan for a list of WiFi networks...
sudo iwlist wlp4s0 Scan

# Pick an SSID and connect
sudo iwconfig wlp4s0 essid NAME key s:ABCDE12345

# Obtain IP Addr with dhcp
sudo dhclient wlp4s0


# Using nmcli...

# List connections previously established
# nmcli c

# Copy uuid from list and connect
# nmcli c up uuid <PASTE UUID HERE>

# For a new connection, use...
# nmcli dev wifi connect <SSID> password <PASS>
