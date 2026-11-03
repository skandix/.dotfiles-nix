#!/usr/bin/env bash
set -e

# take a screenshot with flameshot and send it to copyparty;
# the image url will be placed on your clipboard

PASSWORD_FILE="$HOME/.copyparty-secret"
PASSWORD_STRING=""

COPYPARTY_URL="https://loot.datapor.no/s/"
FILENAME=$(date +%Y-%m%d-%H:%M:%S).png

if [[ -f $PASSWORD_FILE ]]; then
    PASSWORD=$(<"$PASSWORD_FILE")
else
    PASSWORD="$PASSWORD_STRING"
fi

if [[ -n "$WAYLAND_DISPLAY" ]]; then
    flameshot gui -s -r | curl -sS -T- "$COPYPARTY_URL$FILENAME?pw=$PASSWORD" | tail -n 1 | wl-copy
else
    flameshot gui -s -r | curl -sS -T- "$COPYPARTY_URL$FILENAME?pw=$PASSWORD" | tail -n 1 | xsel -ib
fi

