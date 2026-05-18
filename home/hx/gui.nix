{
  config,
  pkgs,
  unstable,
  ...
}:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      unstable.telegram-desktop
      unstable.signal-desktop
      unstable.mumble
      unstable.slack
      unstable.plexamp
      unstable.sublime3
      unstable.plex-desktop
      unstable.remmina
      unstable._1password-gui-beta
      unstable.cider-2

      wireshark
      seahorse
      obsidian
      netflix
      vscode
      zotero
      typst
      anydesk
      typst
      gajim
    ];
  };
}
