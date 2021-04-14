{ pkgs, ... }:

{
  home-manager.users.skandix = {
    home.packages = with pkgs; [
      unstable.dunst
    ];

    xdg.configFile = {
      "dunst/dunstrc".source = ./dunstrc;
    };
  };
}
