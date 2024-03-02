{ config, pkgs, ... }:

{
  imports = [
    # ./hm/configurations/discord
    # ./hm/configurations/hyperland
    ./hm/configurations/i3
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
      # volatility # error: 'volatility' has been removed, as it was broken and unmaintained
      hexedit
      strace
      ltrace
      netcat-gnu
      gobuster
      thc-hydra
      john
      metasploit
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
