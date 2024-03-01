# .nix-conf
> This is my personal nixos-configs.

## Hosts
* ``SpaceCruiser`` - Laptop
* ``TheOrville`` - Workstation
* ``DeathStar`` - Work-Workstatiion

## Install
```bash
nix-env -iA nixos.git
git clone https://github.com/skandix/.nix-conf
cd .nix-conf/scripts 
./format.sh /dev/sd? && ./channels_setup.sh
nixos-generate-config --root /mnt
# symlink desired host configuration.nix into /mnt/etc/nixos/configuration.nix
```

```bash
sudo nix flake check --extra-experimental-features nix-command --extra-experimental-features flakes
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

