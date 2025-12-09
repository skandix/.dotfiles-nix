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
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  programs.dconf.enable = true; # TODO: hvorfor trenger jeg denne her?

  systemd.network.wait-online.enable = lib.mkForce false; # to avoid iface or vbox waiting for connection.
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;

  networking = {
    hostName = "Cerritos";
    hostId = "da3a1045";

    interfaces.eno1 = {
        #ipv6.addresses = [{
          #addresses = "";
          #prefixLength = 64;
        #}];
        ipv4.addresses = [{
          address = "192.168.0.42";
          prefixLength = 24;
        }];
      };
        #defaultGateway6 = {
          #address = "";
          #interface = "eno1";
        #};
        defaultGateway = {
          address = "192.168.0.1";
          interface = "eno1";
        };

    firewall = {
      enable = true;
      #allowedTCPPorts = [ 32400 21063 6123 8123 21064 ];
      #allowedUDPPorts = [ 5353 1900 ];
    };
  };

  services.vscode-server.enable = true;
  services.vscode-server.enableFHS = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    keyMap = "no";
  };


  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  time.timeZone = "Europe/Oslo";
  home-manager.users.hx.home.stateVersion = "25.11";
  system.stateVersion = "25.11";
}
