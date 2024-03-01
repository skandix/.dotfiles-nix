{ config, pkgs, ... }:

{
  imports = [
    ./hm/configurations/alacritty
    ./hm/configurations/discord
    ./hm/configurations/dunst
    ./hm/configurations/firefox
    ./hm/configurations/flameshot
    # ./hm/configurations/hyperland
    ./hm/configurations/i3
    # ./hm/configurations/mangohud
    ./hm/configurations/mpv
    ./hm/configurations/picom
    ./hm/configurations/rofi
    # ./hm/configurations/xscreensaver
  ];

  home-manager.users.hx = {
    home.packages = with pkgs.unstable; [
      ## GENERAL GUI
      tdesktop
      signal-desktop
      tor-browser
      sublime4
      peek
      mumble
      teams
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
      obsidian
      obs-studio

      ## CTF
      volatility
      hexedit
      strace
      ltrace
      netcat-gnu
      gobuster
      thc-hydra
      john
      metasploit-framework
      msfpc
      nmap
      seclists
      sqlmap
      wpscan
      binwalk
      msitools
      ghidra-bin
      sonic-visualiser
      burpsuite
    ];
  };
}
