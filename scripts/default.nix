{pkgs, ...}:

rec {
  ch_setup = pkgs.writeShellScriptBin "ch_setup" ''
    #!/usr/bin/env bash
    nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
    nix-channel --add https://github.com/nix-community/home-manager/archive/release-20.09.tar.gz home-manager
    nix-channel --update
  '';
  _Discord = pkgs.writeShellScriptBin "_Discord" ''
    #!/usr/bin/env bash
    discord --multi-instance
  '';
  diff_hours = pkgs.writeShellScriptBin "diff_hours" ''
    #!/usr/bin/env python3
    import datetime as dt

    start = input("Start: ")
    stop = input("Stop: ")

    stop_dt = dt.datetime.strptime(stop, "%H:%M")
    start_dt = dt.datetime.strptime(start, "%H:%M")
    diff = stop_dt - start_dt
    print(f"===================\nTimer Diff: {diff}")
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
