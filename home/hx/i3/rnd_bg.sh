#!/usr/bin/env bash

background_path="$HOME/.nix-conf/wallpapers/"
random_background="$(ls $background_path | grep -v *.sh | shuf -n 1 )"
feh $background_path$random_background --bg-scale
