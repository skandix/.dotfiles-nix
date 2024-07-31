{ config, pkgs, unstable, ... }:

{
  imports = [
    ./hm/configurations/alacritty
    ./hm/configurations/kitty
    ./hm/configurations/firefox
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
      firefox
      google-chrome
      pavucontrol
      bitwarden
      gnome.seahorse
      obsidian
      sublime
      cider
      activitywatch
      xsecurelock
      xscreensaver
      apple_cursor
    ];
  };
}
