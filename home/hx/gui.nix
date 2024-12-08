{ config, pkgs, unstable, ... }:

{
  imports = [
    ./hm/configurations/alacritty
    ./hm/configurations/mpv
    ./hm/configurations/mangohud
  ];

  home-manager.users.hx = {
    home.packages = with pkgs; [
      tdesktop
      signal-desktop
      tor-browser
      peek
      mumble
      teams-for-linux
      slack
      winbox
      vscode
      plexamp
      wireshark
      plex-media-player
      discord
      seahorse
      obsidian
      sublime
      cider
      activitywatch
      xsecurelock
      xscreensaver
      apple-cursor
      anki-bin
      libreoffice-qt6-fresh
      solaar
      sonic-visualiser
      zathura
    ];
  };
}
