{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
    ../../common/nix-pkg-allow.nix
    ./variables.nix
  ];
}
