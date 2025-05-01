{ pkgs, configs, ... }:

{
  home-manager.users.hx = {
    programs.rofi = {
      enable = true;
    };
    #home.packages = with pkgs; [ rofi ];
    xdg.configFile = {
      "rofi/config.rasi".source = ./config.rasi;
    };
    xdg.configFile = {
      "rofi/spotlight.rasi".source = ./spotlight.rasi;
    };
  };
}
