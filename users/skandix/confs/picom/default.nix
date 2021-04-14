{ pkgs, ... }:

{
  home-manager.users.skandix = {
    home.packages = with pkgs; [
      unstable.picom
    ];

    xdg.configFile = {
      "picom/picom.conf".source = ./picom.conf;
    };
  };
}
