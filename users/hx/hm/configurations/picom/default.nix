{ pkgs, ... }:

{
    home.packages = with pkgs; [
      picom
    ];

    xdg.configFile = {
      "picom/files/picom.conf".source = ./picom.conf;
    };
}
