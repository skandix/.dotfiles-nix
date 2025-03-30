#!/usr/bin/env bash

WALL_PATH="$HOME/.dotfiles-nix/home/hx/wall/"
WALL=$(ls $WALL_PATH | shuf -n1)

export XSECURELOCK_SAVER=saver_mpv
export XSECURELOCK_LIST_VIDEOS_COMMAND='feh --bg-fill $WALL_PATH$WALL'
