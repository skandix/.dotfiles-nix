# .dotfiles-nix
> These are my personal nixos configurations and nix-darwin config

[![Validate Nix Flake](https://github.com/skandix/.dotfiles-nix/actions/workflows/validate.yml/badge.svg)](https://github.com/skandix/.dotfiles-nix/actions/workflows/validate.yml)
[![Check nix flake inputs](https://github.com/skandix/.dotfiles-nix/actions/workflows/check.yml/badge.svg)](https://github.com/skandix/.dotfiles-nix/actions/workflows/check.yml)
[![Bump Flake Inputs](https://github.com/skandix/.dotfiles-nix/actions/workflows/update.yml/badge.svg)](https://github.com/skandix/.dotfiles-nix/actions/workflows/update.yml)

# Hosts
* ``Cerritos`` - Offsite Server
* ``DeathStar`` - Work Workstation
* ``MillenniumFalcon`` - Offsite Server
* ``Narcissus`` - Gandi VPS
* ``SpaceCruiser`` - Linux Laptop
* ``TheOrville`` - Home Workstation
* ``TheVoyager`` - Macos Latop

# Install

## Nixos
```bash
wget https://raw.githubusercontent.com/skandix/.nix-conf/main/scripts/format.sh
./format.sh /dev/sd? # format drives if nvme it needs to be /dev/nvme0n1
sudo nixos-install --root /mnt --flake github:skandix/.nix-conf#(DeathStar|TheOrville|SpaceCruiser)
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
