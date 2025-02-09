{ config, pkgs, ... }:

{
  virtualisation.docker = {
    enable = true;
    package = pkgs.docker_25;
    autoPrune.enable = true;
  };

  environment.systemPackages = with pkgs; [ docker-compose ];
}
