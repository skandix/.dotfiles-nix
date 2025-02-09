{ pkgs, configs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [ walker ];
    xdg.configFile = { "walker/config.json".source = ./config.json; };
  };
}
