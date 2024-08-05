{ config, pkgs, unstable, ... }:

{
  imports = [
    ./hm/configurations/kitty
    ./hm/configurations/mpv
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
      gnome.seahorse
      obsidian
      sublime
      cider
      activitywatch
      xsecurelock
      xscreensaver
      apple-cursor
      anki-bin
    ];
  };
}
