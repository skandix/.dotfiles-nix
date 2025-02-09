{ pkgs, configs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [ tofi ];
    #xdg.configFile = { "walker/config.json".source = ./config.json; };
  };
}
