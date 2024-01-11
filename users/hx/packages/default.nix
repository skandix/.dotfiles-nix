{ config, pkgs, ... }:

{
  imports = [
    <home-manager/nixos>
    ./cli.nix
    ./ctf-tools.nix
    ./gui.nix
    ./network-tool.nix
    ./python.nix
    ./rust.nix
  ];
}