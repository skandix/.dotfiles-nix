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

    ../../common/intelcpu.nix
    ../../common/intelgpu.nix
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

  boot.loader = {
    systemd-boot = {
      enable = true;
      editor = false;
    };
    efi = {
      canTouchEfiVariables = false;
    };
  };

  zramSwap = {
    enable = true;
  };

  networking = {
    hostName = "Cerritos";
    hostId = "da3a1045";

    interfaces.eno1 = {
        ipv6.addresses = [{
          address = "2a02:ed06::200";
          prefixLength = 64;
        }];
        ipv4.addresses = [{
          address = "185.35.2202.200";
          prefixLength = 26;
        }];
      };
        defaultGateway6 = {
          address = "20a2:ed06::1";
          interface = "eno1";
        };
        defaultGateway = {
          address = "185.35.202.193";
          interface = "eno1";
        };

    firewall = {
      enable = true;
      #allowedTCPPorts = [ 32400 21063 6123 8123 21064 ];
      #allowedUDPPorts = [ 5353 1900 ];
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  home-manager.users.hx.home.stateVersion = "25.11";
  system.stateVersion = "25.11";
}
