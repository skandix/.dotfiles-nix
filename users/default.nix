{ config, pkgs, ... }:

{
  imports = [<home-manager/nixos>];

  users.groups.hx.gid = 1000;
  users.users.hx = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
      "audio"
      "video"
      "screen"
      "plugdev"
      "libvirtd"
      "input"
      "lp"
      "scanner"
      "networkmanager"
      "wireshark"
      "vboxusers"
    ];
    group = "hx";
    shell = pkgs.bash;
  };

  home-manager.users = {
    hx = (import ./hx/core.nix);
  };
}
