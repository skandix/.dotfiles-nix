{ pkgs, configs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [ rofi ];
    xdg.configFile = {
      "rofi/config.rasi".source = ./config.rasi;
    };
    xdg.configFile = {
      "rofi/spotlight.rasi".source = ./spotlight.rasi;
    };
  };
}
