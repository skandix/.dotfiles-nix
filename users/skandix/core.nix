{ config, pkgs, ... }:

let
  comma = import (builtins.fetchTarball "https://github.com/Shopify/comma/archive/60a4cf8ec5c93104d3cfb9fc5a5bac8fb18cc8e4.tar.gz") { inherit pkgs; };
in {
  imports = [
    # Tools
    ./dots.nix
    ./python.nix
    ./network-tools.nix
    ./ctf-tools.nix

    # confs
    ./confs/vim/default.nix
    ./confs/bashrc/default.nix

    # Common - Repo
    ../../common/repo/unstable.nix
    ../../common/repo/master.nix

  ];

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    unstable.jq
    unstable.ripgrep
    unstable.htop
    gcc
    pavucontrol
    libnotify
    lm_sensors
    screen
    inotify-tools
    unzip
    comma
    bat
    pfetch
    wget
    git
    strace
    ltrace
  ];

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
  };
}
