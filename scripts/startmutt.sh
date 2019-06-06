#!/bin/bash

# Wait for internet to come up
while ! ping -c 1 -W 1 linux.org; do
    sleep 1
done

# Start mutt
mutt
