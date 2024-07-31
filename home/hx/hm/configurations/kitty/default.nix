{ pkgs, unstable ... }:

{
  home-manager.users.hx = {
    home.packages = with pkgs; [ unstable.kitty ];
    # xdg.configFile = {
    #   "alacritty/alacritty.toml".source = ./alacritty.toml;
    # };
  };
}
