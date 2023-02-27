{ config, pkgs, ... }:

{
   imports = [
     # Gui
     ./confs/i3/default.nix
    # Common - Repo
    ../../common/repo/unstable.nix
    ../../common/repo/master.nix
   ];

  home-manager.users.hx = {
    home.packages = with pkgs; [
      # Comms
      slack
      discord
      tdesktop
      teams
      zoom-us

      # Entertainment
      plex-media-player
      plexamp
      mpv
      foliate

      # Productivity
      firefox
      google-chrome
      vscode
      sublime4

      # Tools
      pavucontrol
      filezilla
      nm-tray
      gnome3.seahorse
      peek
      bitwarden
    ];
  };
}
