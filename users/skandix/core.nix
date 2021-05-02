{ config, pkgs, ... }:

# importingi scripts n shit
with import ../../scripts/default.nix { inherit pkgs; };

let
  comma = import (builtins.fetchTarball "https://github.com/Shopify/comma/archive/60a4cf8ec5c93104d3cfb9fc5a5bac8fb18cc8e4.tar.gz") { inherit pkgs; };
in {
  imports = [
    # Tools
    ./python.nix
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
    _Obsidian
    _Telegram
    ch_setup
    blanking
    mpvuia
    comma
  ];
}
