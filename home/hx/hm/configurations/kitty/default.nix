{ pkgs, ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [ kitty ];
    # xdg.configFile = {
    #   "alacritty/alacritty.toml".source = ./alacritty.toml;
    # };
  };
}
