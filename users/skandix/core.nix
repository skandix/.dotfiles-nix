{ config, pkgs, ... }:

let
  comma = import (builtins.fetchTarball "https://github.com/Shopify/comma/archive/60a4cf8ec5c93104d3cfb9fc5a5bac8fb18cc8e4.tar.gz") { inherit pkgs; };
in {
  imports = [
    ./dots.nix
    ./python.nix

    ./confs/vim/default.nix
  ];

  programs.home-manager.enable = true;

  home.packages = with pkgs; [
    jq
    gcc
    pavucontrol
    libnotify
    lm_sensors
    screen
    tmux
    inotify-tools
    ripgrep
    unzip
    comma
    bat
    pfetch
    neofetch
    htop
    wget
    git
  ];

  nixpkgs.config = {
    allowBroken = true;
    allowUnfree = true;
  };
}
