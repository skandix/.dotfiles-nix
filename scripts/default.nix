{pkgs, ...}:

rec {
  _Obsidian = pkgs.writeShellScriptBin "_Obsidian" ''
    #!/usr/bin/env bash
    host=$HOSTNAME
    date=$(date | cut -d' ' -f 1-4)
    cd && cd Documents/ && git pull && obsidian && git add . && git commit -s -m " Auto Commit on Close at $host - $date  " && git push
  '';
  _Telegram = pkgs.writeShellScriptBin "_Telegram" ''
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
  '';
  ch_setup = pkgs.writeShellScriptBin "ch_setup" ''
    #!/usr/bin/env bash
    nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
    nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
    nix-channel --update
  '';
  mpvuia = pkgs.writeShellScriptBin "mpvuia" ''
    #!/usr/bin/env bash
    course=$(rofi -dmenu -p "Course To Watch" -lines 0)
    stream_url="https://live.uia.no/live/ngrp:"$course"_all/playlist.m3u8"
    mpv $stream_url &
  '';
  blanking = pkgs.writeShellScriptBin "blanking" ''
    #!/usr/bin/env bash
    xset s off
    xset -dpms
    xset s noblank
  '';
}
