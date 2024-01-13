{ config, pkgs, home-manager, ... }:

{
  imports = [
    ./git
    ./common
    ./zsh
  ];
  programs.home-manager.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
  };
}
