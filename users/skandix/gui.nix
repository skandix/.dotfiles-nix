{ config, pkgs, ... }:

{
   imports = [
     # Gui
     ./confs/i3/default.nix

    # Common - Repo
    ../../common/repo/unstable.nix
    ../../common/repo/master.nix
   ];

  home-manager.users.skandix = {
    home.packages = with pkgs; [
      # Comms
      slack
      discord
      unstable.tdesktop
      unstable.teams
      signal-desktop
      zoom

      # Entertainment
      spotify
      plex-media-player
      mpv

      # Libs
      nss_3_44

      # Productivity
      unstable.firefox
      obsidian

      # Code
      unstable.vscode
      sublime3-dev

      # Tools
      pavucontrol
      unstable.filezilla
      nm-tray
      unstable.teamviewer
      torbrowser
      gnome3.seahorse
      peek
    ];
  };
}
