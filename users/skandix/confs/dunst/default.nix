{ pkgs, ... }:

{
  home-manager.users.skandix = {
    home.packages = with pkgs; [
      dunst
    ];

    xdg.configFile = {
      "dunst/dunstrc".source = ./dunstrc;
    };
  };
}
