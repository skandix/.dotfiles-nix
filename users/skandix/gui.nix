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
      unstable.slack
      unstable.discord
      unstable.tdesktop
      unstable.teams
      zoom-us

      # Entertainment
      unstable.plex-media-player
      plexamp
      mpv

      # Productivity
      unstable.firefox
      unstable.google-chrome

      # Code
      vscode
      sublime4

      # Tools
      pavucontrol
      unstable.filezilla
      nm-tray
      gnome3.seahorse
      peek
      qalculate-gtk
      bitwarden
    ];
  };
}
