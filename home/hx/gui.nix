{
  config,
  pkgs,
  unstable,
  ...
}:

{
  imports = [
    ./hm/configurations/mpv
  ];

  home-manager.users.hx = {
    home.packages = with pkgs; [
      tdesktop
      signal-desktop
      tor-browser
      peek
      mumble
      teams-for-linux
      slack
      vscode
      plexamp
      wireshark
      plex-desktop
      discord
      seahorse
      obsidian
      sublime
      sonic-visualiser
      zathura
      netflix
      walker
    ];
  };
}
