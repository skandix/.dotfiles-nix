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
      signal-desktop
      tor-browser
      peek
      mumble
      teams-for-linux
      slack
      bambu-studio
      vscode
      plexamp
      wireshark
      plex-desktop
      seahorse
      obsidian
      sonic-visualiser
      zathura
      netflix
      sublime
      inkscape
      unstable.planify
      librewolf
      cider
    ];
  };
}
