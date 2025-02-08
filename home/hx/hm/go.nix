# source: https://github.com/fbegyn/nixos-configuration/blob/main/users/francis/hm/go.nix

{ config, pkgs, ... }:

{
  programs.go = {
    enable = true;
    goPath = ".go";
    package = pkgs.unstable.go_1_22;
  };
}
