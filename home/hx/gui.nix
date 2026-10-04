{
  config,
  pkgs,
  unstable,
  ...
}:

{
  home-manager.users.hx = {
    imports = [
      ./hm/configurations/librewolf
      ./hm/configurations/ghostty
      ./hm/configurations/mpv
      ./hm/configurations/discord
    ];

    gtk = {
      enable = true;
      theme = {
        name = "Adwaita-dark";
        package = pkgs.gnome-themes-extra;
      };
    };

    home.packages = with pkgs; [
      unstable.telegram-desktop
      unstable.signal-desktop
      unstable.mumble
      unstable.slack
      unstable.plexamp
      unstable.sublime3
      unstable.plex-desktop
      unstable._1password-gui-beta
      unstable.cider-2

      playerctl
      xclip
      gnome-keyring
      seahorse
      obsidian
      vscode
      zotero
      anydesk
      gajim
      kdePackages.okular
      qgis
      qFlipper
      imhex
    ];
  };

  programs.wireshark = {
    enable = true;
    package = pkgs.wireshark;
  };
}
