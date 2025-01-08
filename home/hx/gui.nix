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
      vscode
      plexamp
      wireshark
      plex-desktop
      discord
      seahorse
      obsidian
      sublime
      xsecurelock
      xscreensaver
      solaar
      sonic-visualiser
      zathura
      netflix
    ];
  };
}
