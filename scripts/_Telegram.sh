#!/usr/bin/env bash
dirExsists(){
echo ""
	if [ -d $1 ]
	then
		echo "[O.K] Found $1"
	else
		echo "[Error]: Can't find $1, Creating directory"
		mkdir -p $1
	fi
}

dirExsists $HOME/.local/share/TelegramDesktop/$USER
exec_tg=$(whereis telegram-desktop -b | cut -d':' -f 2)
$exec_tg -workdir $HOME/.local/share/TelegramDesktop/$USER -- %u