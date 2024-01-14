{ config, pkgs, home-manager, ... }:

{
  imports = [
    ./configurations/git
    ./configurations/zsh
  ];
  programs.home-manager.enable = true;

  nixpkgs.config = {
    allowUnfree = true;
  };
}
