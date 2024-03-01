{ pkgs, ... }:

{
    home.packages = with pkgs; [
      dunst
    ];

    xdg.configFile = {
      "dunst/files/dunstrc".source = ./dunstrc;
    };
}
