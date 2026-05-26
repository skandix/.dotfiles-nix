{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    ./hardware-configuration.nix

    ../../home
    ../../home/hx
    ../../home/hx/cli.nix
    ../../home/hx/dev.nix

    ../../common/amdcpu.nix
    ../../common/amdgpu.nix
    ../../common/docker.nix
    ../../common/networkmanager.nix
    ../../common/tailscale.nix
    ../../common/nix-pkg-allow.nix
    ../../common/fwupd.nix
    ../../common/nix-tweakz.nix
    ../../common/ssh-client.nix
    ../../common/sshd.nix
    ../../common/autoUpgrade.nix
    ../../common/vscode-server.nix
  ];

  environment.etc."ssh/banner".source = ./ssh_banner;
  services.openssh.settings.Banner = "/etc/ssh/banner";


  boot = {
    zfs = {
      forceImportRoot = false;
    };

    loader = {
      systemd-boot = {
        enable = true;
        editor = false;
      };

      efi = {
        canTouchEfiVariables = false;
      };
    };
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 50;
  };

  networking = {
    hostName = "Ainsworth";
    useDHCP = false;
    interfaces = {
      enp4s0 = {
        useDHCP = true;
      };
      wlp5s0 = {
        useDHCP = false;
      };
    };
    hostId = "666fc31b";
    firewall = {
      enable = true;
      allowedTCPPorts = [ 32400 21063 6123 8123 21064 ];
      allowedUDPPorts = [ 5353 1900 ];
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home-manager.users.hx.home.stateVersion = "26.05";
  system.stateVersion = "26.05";
}
