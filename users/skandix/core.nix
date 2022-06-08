{ config, pkgs, ... }:

# importing in scripts n shit
with import ../../scripts/default.nix { inherit pkgs; };

{
  imports = [
    # Tools
    #./python.nix
    #./rust.nix
    ./network-tools.nix
    ./ctf-tools.nix

    # Shell
    ./confs/fish.nix
    ./confs/fzf.nix

    # Common - Repo
    ../../common/repo/unstable.nix
    ../../common/repo/master.nix
    ../../common/nix-pkg-allow.nix
  ];

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    _Discord
    ch_setup
    blanking
    mpvuia
    #comma
  ];
}
