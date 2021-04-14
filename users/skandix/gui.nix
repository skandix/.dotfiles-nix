{ config, pkgs, ... }:

{
  home-manager.users.skandix = {
    imports = [
     ./confs/i3/default.nix
  ];

    home.packages = with pkgs; [
      # Comms
      slack
      unstable.discord
      unstable.tdesktop
      unstable.teams
      zoom

      # Entertainment
      spotify
      plex-media-player
      mpv

      # Productivity
      firefox

      # Code
      unstable.vscode

      # Tools
      pavucontrol
      unstable.filezilla
    ];
  };
}
