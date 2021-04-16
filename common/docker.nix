{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
  };

  home-manager.users.skandix = {
    home.packages = with pkgs; [
      docker-compose
    ];
  };
}
