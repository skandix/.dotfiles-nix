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
      tdesktop
      signal-desktop
      tor-browser
      #peek
      mumble
      teams-for-linux
      slack
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
      unstable.zed-editor
    ];
  };
}
