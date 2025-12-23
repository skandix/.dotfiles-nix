{ home-manager, pkgs, ... }:

{
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
      "podman"
    ];
    group = "hx";
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIH9UcMEfA479EV6PcAinoLvQHyauBSpU94VgfdBivaUB"
    ];
    initialPassword = "hunter2k"; # used for build-vm and init deployment of nixos-anywhere
  };

  users.users.hx.ignoreShellProgramCheck = true;

  home-manager.users = {
    hx = (import ./hx/home.nix);
  };
}
