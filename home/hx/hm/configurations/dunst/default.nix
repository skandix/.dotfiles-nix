{ pkgs, ... }:

{
  home-manager.users.hx = {
    services.dunst = {
      enable = true;
    };

    xdg.configFile = {
      "dunst/dunstrc".source = ./dunstrc;
    };
  };
}
