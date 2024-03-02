{ pkgs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [ picom ];

    xdg.configFile = { "picom/files/picom.conf".source = ./picom.conf; };
  };
}
