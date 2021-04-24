{ config, pkgs, ... }:

{
  imports = [<home-manager/nixos>];

  users.groups.skandix.gid = 1000;
  users.users.skandix = {
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
    ];
    group = "skandix";
    shell = pkgs.fish;
  };

  home-manager.users = {
    skandix = (import ./skandix/core.nix);
  };
}
