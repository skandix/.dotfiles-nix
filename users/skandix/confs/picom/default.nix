{ pkgs, ... }:

{
  home-manager.users.skandix = {
    home.packages = with pkgs; [
      picom
    ];

    xdg.configFile = {
      "picom/picom.conf".source = ./picom.conf;
    };
  };
}
