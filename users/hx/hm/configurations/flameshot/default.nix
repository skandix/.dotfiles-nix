{ pkgs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [ flameshot ];
    xdg.configFile = {
      "flameshot/flameshot.ini".source = ./flameshot.ini;
    };
  };
}
