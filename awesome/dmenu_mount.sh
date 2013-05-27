#!/bin/bash

# find mountable devices with filesystem
devices() { blkid | grep -v "^/dev/sda" | awk -F \: '{print$1}'; }
device_chosen=$( devices | dmenu -nb '#63B8FF' -sb '#EE4000' -nf '#000000' -fn '-*-*-bold-*-*-*-18-*-*-*-*-*-*-*')
#dev= "$device_chosen" | awk -F \/ '{print$3}' 
pmount $device_chosen && notify-send "$device_chosen mounted to /media/$(echo "$device_chosen" | awk -F \/ '{print$3}')"
