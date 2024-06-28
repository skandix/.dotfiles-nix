{ config, pkgs, unstable, ... }:

{
  imports = [
    ./hm/configurations/alacritty
    ./hm/configurations/firefox
    ./hm/configurations/mpv
  ];

  home-manager.users.hx = {
    home.packages = with pkgs; [
      ## GENERAL GUI
      tdesktop
      signal-desktop
      tor-browser
      peek
      mumble
      teams-for-linux
      slack
      # zoom-us
      vscode
      plexamp
      plex-media-player
      discord
      mpv
      firefox
      google-chrome
      pavucontrol
      nm-tray
      bitwarden
      gnome.seahorse
      obsidian
      ulauncher
      sublime
      cider
      activitywatch
      #zed-editor # not quite a editor to use as of now 26. june 2024
      # obs-studio

      ## LOCKSCREEN + SCREENSAVER
       xsecurelock
       xscreensaver

      ## CTF
      # volatility # error: 'volatility' has been removed, as it was broken and unmaintained
      # ghidra-bin
      # sonic-visualiser
    ];
  };
}
