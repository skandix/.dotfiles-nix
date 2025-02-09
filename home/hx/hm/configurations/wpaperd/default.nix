{ pkgs, configs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [ wpaperd ];
    xdg.configFile = { "wpaperd/config.toml".source = ./config.toml; };
  };
}
