{ config, pkgs, ...}:

{

  imports = [
    ../../home/hx
  ];
  home.stateVersion = "24.05";

  # programs.home-manager.enable = true;
}