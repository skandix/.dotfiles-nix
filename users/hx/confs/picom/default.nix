{ pkgs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      picom
    ];

    xdg.configFile = {
      "picom/picom.conf".source = ./picom.conf;
    };
  };
}
