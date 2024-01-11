{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
  };

  environment.packages = with pkgs; [
    docker-compose
  ];
}
