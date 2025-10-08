{
  config,
  pkgs,
  unstable,
  ...
}:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      tdesktop
      unstable.signal-desktop
      tor-browser
      unstable.mumble
      slack
      vscode
      plexamp
      wireshark
      plex-desktop
      seahorse
      obsidian
      zathura
      netflix
      sublime3
      librewolf
      chromium #needed to export pdf from marp
      teams-for-linux
      zotero
      typst
    ];
  };
}
