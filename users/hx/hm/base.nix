{ config, pkgs, home-manager, ... }:

{
  imports = [
    ./configurations/git
    ./configurations/common
    ./configurations/zsh
  ];
  programs.home-manager.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
  };
}
