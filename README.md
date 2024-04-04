# .dotfiles-nix
> This is my personal nixos-configs.

## Hosts
* ``SpaceCruiser`` - Laptop
* ``TheOrville`` - Workstation
* ``DeathStar`` - Work-Workstatiion

## Install
```bash
wget https://raw.githubusercontent.com/skandix/.nix-conf/main/scripts/format.sh
./format.sh /dev/sd?
sudo nixos-install --flake github:skandix/.nix-conf#(DeathStar|TheOrville|SpaceCruiser)
```

## Resources
* https://github.com/fbegyn/nixos-configuration
* https://search.nixos.org/packages
* https://search.nixos.org/options
* https://nixcloud.io/tour/?id=1
* https://github.com/nh2/nixops-tutorial
* https://grahamc.com/blog/erase-your-darlings
* https://weekly.nixos.org
* https://nixos.org/guides/nix-pills/index.html
* https://nix.dev/
* https://nixos.wiki/wiki/For_Beginners

