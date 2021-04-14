{ config, pkgs, ... }:

{
   imports = [
     ./confs/i3/default.nix

    # Common - Repo
    ../../common/repo/unstable.nix
    ../../common/repo/master.nix
   ];

  home-manager.users.skandix = {
    home.packages = with pkgs; [
      # Comms
      slack
      unstable.discord
      unstable.tdesktop
      unstable.teams
      signal-desktop
      zoom

      # Entertainment
      spotify
      plex-media-player
      mpv

      # Productivity
      firefox
      obsidian

      # Code
      unstable.vscode
      sublime3-dev

      # Tools
      pavucontrol
      unstable.filezilla
      nm-tray
    ];
  };
}
