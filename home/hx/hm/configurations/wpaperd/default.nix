{ pkgs, configs, ... }:

{
  home-manager.users.hx = {
    services.wpaperd = {
      enable = true;
      settings = {
        default = {
          path = "/home/hx/.dotfiles-nix/home/hx/wall/";
          duration = "60m";
          sorting = "random";
        };
        default.transition.hexagonalize = {
          steps = 50;
          horizontal-hexagons = 20.0;
        };
      };
    };
  };
}
