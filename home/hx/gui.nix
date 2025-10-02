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
      # peek
      unstable.mumble
      slack
      vscode
      plexamp
      wireshark
      plex-desktop
      seahorse
      obsidian
      #sonic-visualiser
      zathura
      netflix
      sublime3
      #inkscape
      #unstable.thunderbird
      librewolf
      chromium #needed to export pdf from marp
      #qflipper
      #keymapp
      shotwell
      teams-for-linux
      zotero
      unstable.blender
    ];
  };
}
