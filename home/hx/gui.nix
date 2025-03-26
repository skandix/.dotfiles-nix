{
  config,
  pkgs,
  unstable,
  ...
}:

{
  imports = [
    ./hm/configurations/mpv
    ./hm/configurations/discord
  ];

  home-manager.users.hx = {
    home.packages = with pkgs; [
      tor-browser
      peek
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
    ];
  };
}
