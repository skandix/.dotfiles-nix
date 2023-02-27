{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
  };

  home-manager.users.hx = {
    home.packages = with pkgs; [
      docker-compose
    ];
  };
}
