{ config, pkgs, unstable, ... }:

{
  imports = [
    ./hm/configurations/alacritty
    ./hm/configurations/dunst
    ./hm/configurations/flameshot
    ./hm/configurations/firefox
    ./hm/configurations/mpv
    ./hm/configurations/picom
    ./hm/configurations/rofi
    # ./hm/configurations/discord
    # ./hm/configurations/hyperland
    # ./hm/configurations/mangohud
    # ./hm/configurations/xscreensaver
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
      zoom-us
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
      unstable.cider
      # obs-studio

      xsecurelock
      xscreensaver
      ## CTF
      # volatility # error: 'volatility' has been removed, as it was broken and unmaintained
      # ghidra-bin
      # sonic-visualiser
    ];
  };
}
