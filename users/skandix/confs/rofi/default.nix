{ pkgs, configs, ... }:

{
  home-manager.users.skandix = {
    home.packages = with pkgs; [
      rofi
    ];

    xdg.configFile = {
      "rofi/config.rasi".source = ./config.rasi;
    };
  };
}
