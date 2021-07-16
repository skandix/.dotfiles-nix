#!/usr/bin/env bash
nix-channel --add https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz nixos
nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager

nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
nix-channel --add https://github.com/NixOS/nixpkgs/archive/refs/heads/nixos-unstable.tar.gz unstable
nix-channel --add https://github.com/NixOS/nixpkgs/archive/refs/heads/nixos-unstable-small.tar.gz unstable-small

nix-channel --update
