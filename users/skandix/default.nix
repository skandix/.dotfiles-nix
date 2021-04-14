{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
  ];

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
  };

}
