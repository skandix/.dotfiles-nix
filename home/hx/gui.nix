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
      peek
      mumble
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
      sublime3
      inkscape
      unstable.thunderbird
      #unstable.planify # electron problems
      librewolf
      cider
      picard
    ];
  };
}
