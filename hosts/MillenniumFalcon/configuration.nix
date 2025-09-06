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
    ../../common/networkmanager.nix
    ../../common/tailscale.nix
    ../../common/sshd.nix
    ../../common/docker.nix
    ../../common/nix-pkg-allow.nix
    ../../common/fwupd.nix
    ../../common/nix-tweakz.nix
    ../../common/ssh-client.nix
    ../../common/virtualization.nix
    ../../common/health.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  systemd.network.wait-online.enable = lib.mkForce false; # to avoid iface or vbox waiting for connection.
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
  networking.hostName = "MillenniumFalcon";
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    keyMap = "no";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  time.timeZone = "Europe/Oslo";
  home-manager.users.hx.home.stateVersion = "25.05";
  system.stateVersion = "25.05";
}
