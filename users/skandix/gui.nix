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
      discord
      unstable.tdesktop
      unstable.teams
      zoom-us

      # Entertainment
      plex-media-player
      plexamp
      mpv
      foliate
      # Productivity
      firefox
      #notion-app-enhanced
      #unstable.texstudio
      #texlive.combined.scheme-full

      # Code
      unstable.vscode
      sublime4

      # CREATIVITY
      #gimp

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
