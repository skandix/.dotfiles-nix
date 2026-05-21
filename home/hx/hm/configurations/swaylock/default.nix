{ pkgs, config, unstable, ... }:

{
  home-manager.users.hx = {
      programs.swaylock = {
          enable = true;
          settings = {
              show-failed-attempts = true;
              image = "/home/hx/.dotfiles-nix/home/hx/wall/22477588234.jpg";
              scaling = "fill";
          };
      };
  };
  security.pam.services.swaylock = {};
}
