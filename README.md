# .dotfiles-nix
> These are my personal nixos configurations and nix-darwin config

[![Validate Nix Flake](https://github.com/skandix/.dotfiles-nix/actions/workflows/validate.yml/badge.svg)](https://github.com/skandix/.dotfiles-nix/actions/workflows/validate.yml)
[![Check nix flake inputs](https://github.com/skandix/.dotfiles-nix/actions/workflows/check.yml/badge.svg)](https://github.com/skandix/.dotfiles-nix/actions/workflows/check.yml)
[![Bump Flake Inputs](https://github.com/skandix/.dotfiles-nix/actions/workflows/update.yml/badge.svg)](https://github.com/skandix/.dotfiles-nix/actions/workflows/update.yml)

# Hosts
* ``DeathStar`` - Work
* ``TheOrville`` - Home
* ``TheVoyager`` - Macos
* ``Ainsworth`` - Server
* ``Cerritos`` - Server
* ``MillenniumFalcon`` - Server
* ``Lynx`` - Server
* ``SpaceCruiser`` - Laptop

# Install

## Nixos
```bash
nixos-install --flake github:skandix/.nix-conf#(DeathStar|TheOrville)
```

## Nixos Anywhere

```bash 
nix run nixpkgs#nixos-anywhere -- \
    --flake .#(TheOrville|DeathStar) \
    root@172.16.0.12
```

```bash
nix run nixpkgs#nixos-anywhere -- \
    --flake .#(TheOrville|DeathStar) \
    --generate-hardware-config nixos-generate-config ./hardware-configuration.nix \
    root@172.16.0.12
```

## Macos
Install nix with - https://github.com/DeterminateSystems/nix-installer
```bash
make macos
```

# Resources

## Options
* https://home-manager-options.extranix.com/
* https://search.nixos.org/options

## Wiki
* https://wiki.nixos.org/wiki/NixOS_Wiki
* https://nixos.wiki/
* https://nix.dev/

## Inspiration
* https://github.com/fbegyn/nixos-configuration
* https://grahamc.com/blog/erase-your-darlings
* https://github.com/isabelroses/dotfiles

## Refrence
* https://nixos-and-flakes.thiscute.world/
* https://search.nixos.org/packages
* https://nixcloud.io/tour/?id=1
* https://nixos.org/guides/nix-pills/index.html
* https://nixos.wiki/wiki/For_Beginners
