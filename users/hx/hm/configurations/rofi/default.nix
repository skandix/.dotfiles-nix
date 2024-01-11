{ pkgs, configs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [
      rofi
    ];

    xdg.configFile = {
      "rofi/files/config.rasi".source = ./config.rasi;
    };
  };
}
