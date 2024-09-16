#!/usr/bin/env sh
to_watch=(https://www.twitch.tv/piratesoftware \
    https://www.twitch.tv/missjackiecr \
    https://www.twitch.tv/fribergcs
    )
series=$(printf "'%s'\n" ${to_watch[*]} | tr -d "'" | rofi -dmenu -p "What to watch?")

mpv  $series  &
