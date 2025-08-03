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
      unstable.mumble
      slack
      vscodium
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
      librewolf
      openscad
      qflipper
      keymapp
    ];
  };
}
