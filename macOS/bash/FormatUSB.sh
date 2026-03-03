#!/bin/zsh
externalUSB=$(diskutil list | grep "external" | awk '{print $1}')

#format usb
diskutil eraseDisk ExFat USB "$externalUSB"

