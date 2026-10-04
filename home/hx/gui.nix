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

      wireshark
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
}
