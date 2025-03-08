{ config, pkgs, unstable, ... }:

{
  virtualisation.docker = {
    enable = true;
    package = unstable.docker;
    autoPrune.enable = true;
  };

  environment.systemPackages = with pkgs; [ unstable.docker-compose ];
}
