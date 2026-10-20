#!/usr/bin/env bash

output=""
mouse(){
    MOUSE_PATH="/sys/class/power_supply/hidpp_battery_0/$1"
    cat "$MOUSE_PATH"
}

output+="$(mouse manufacturer) "
output+="$(mouse model_name) "
output+="$(mouse capacity)%"
echo "$output"
