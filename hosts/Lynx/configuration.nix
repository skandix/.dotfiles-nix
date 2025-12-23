{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix
    ./disk-config.nix

    ../../home
    ../../home/hx
    ../../home/hx/cli.nix
    ../../home/hx/dev.nix

    ../../common/amdcpu.nix
    ../../common/docker.nix
    ../../common/networkmanager.nix
    ../../common/tailscale.nix
    ../../common/nix-pkg-allow.nix
    ../../common/nix-tweakz.nix
    ../../common/ctf.nix
    ../../common/virtualbox.nix
    ../../common/ssh-client.nix
    ../../common/sshd.nix
    ../../common/autoUpgrade.nix
  ];

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  zramSwap = {
    enable = true;
  };

  networking = {
    hostName = "Lynx";
    useDHCP = false;
    interfaces = {
      ens3 = {
        useDHCP = true;
      };
    };
    hostId = "666dc31b";
    #firewall = {
      #enable = true;
      #allowedTCPPorts = [ 32400 21063 6123 8123 21064 ];
      #allowedUDPPorts = [ 5353 1900 ];
    #};
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home-manager.users.hx.home.stateVersion = "25.11";
  system.stateVersion = "25.11";
}
