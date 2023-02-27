{ pkgs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      dunst
    ];

    xdg.configFile = {
      "dunst/dunstrc".source = ./dunstrc;
    };
  };
}
