{ config, pkgs, ... }:

with import ./packages/default.nix { inherit pkgs; };

{
}
