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
    ../../common/health.nix
    ../../common/nix-tweakz.nix
    ../../common/ssh-client.nix
    ../../common/sshd.nix
    #../../common/autoUpgrade.nix
    ../../common/virtualization.nix
    #../../common/vscode-server.nix
  ];

  environment.etc."ssh/banner".source = ./ssh_banner;
  services.openssh.settings.Banner = "/etc/ssh/banner";

  services.zfs = {
    autoScrub = {
      enable = true;
      interval = "monthly";
    };

    trim = {
      enable = true;
    };
  };

  systemd.services.docker = {
    after = [ "zfs-mount.service" ];
    wants = [ "zfs-mount.service" ];
  };

  boot = {
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
      allowedTCPPorts = [
        32400
        21063
        6123
        8123
        21064
      ];
      allowedUDPPorts = [
        5353
        1900
      ];
    };
  };

  home-manager.users.hx.home.stateVersion = "26.05";
  system.stateVersion = "26.05";
}
