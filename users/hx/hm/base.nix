{ config, pkgs, home-manager, ... }:

{
  imports = [
    "./configurations/"
  ];
  programs.home-manager.enable = true;
}
