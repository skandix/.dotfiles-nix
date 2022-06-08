#!/usr/bin/env bash

nix-channel --add https://channels.nixos.org/nixos-21.11 nixos
nix-channel --add https://github.com/nix-community/home-manager/archive/release-21.11.tar.gz home-manager
nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
nix-channel --add https://github.com/NixOS/nixpkgs/archive/refs/heads/nixpkgs-unstable.tar.gz unstable
nix-channel --add https://github.com/NixOS/nixpkgs/archive/refs/heads/nixos-unstable-small.tar.gz unstable-small

nix-channel --update
