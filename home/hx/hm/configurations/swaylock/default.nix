{ pkgs, config, unstable, ... }:

{
  home-manager.users.hx = {
      programs.swaylock = {
          enable = true;
          settings = {
              show-failed-attempts = true;
          };
      };
  };
  security.pam.services.swaylock = {};
}
