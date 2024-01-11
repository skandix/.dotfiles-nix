{ config, pkgs, ... }:

{
   imports = [
     ./confs/i3/default.nix
   ];

  home-manager.users.hx = {
    home.packages = with pkgs; [
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
      filezilla
      nm-tray
      gnome3.seahorse
      bitwarden
      obsidian
      obs-studio
    ];
  };
}
