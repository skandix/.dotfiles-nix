{ pkgs, configs, ... }:

{
  home-manager.users.skandix = {
    home.packages = with pkgs; [
      unstable.rofi
    ];

    xdg.configFile = {
      "rofi/config.rasi".source = ./config.rasi;
    };
  };
}
