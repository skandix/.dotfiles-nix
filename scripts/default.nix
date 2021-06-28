{pkgs, ...}:

rec {
  _Obsidian = pkgs.writeShellScriptBin "_Obsidian" ''
    #!/usr/bin/env bash
    host=$HOSTNAME
    date=$(date | cut -d' ' -f 1-4)
    cd && cd Documents/ && git pull && obsidian && git add . && git commit -s -m " Auto Commit on Close at $host - $date  " && git push
  '';
  _Discord = pkgs.writeShellScriptBin "_Discord" ''
    #!/usr/bin/env bash
    Discord --multi-instance
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
