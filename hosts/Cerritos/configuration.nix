{
  config,
  pkgs,
  lib,
  ...
}:

{
  imports = [
    # Hardware udev rules
    ./hardware-configuration.nix

    # core dotfiles + graphical things
    ../../home
    ../../home/hx
    ../../home/hx/cli.nix
    ../../home/hx/dev.nix

    # Common
    ../../common/intelcpu.nix
    ../../common/intelgpu.nix
    ../../common/docker.nix
    ../../common/networkmanager.nix
    ../../common/nix-pkg-allow.nix
    ../../common/fwupd.nix
    ../../common/nix-tweakz.nix
    ../../common/ssh-client.nix
    ../../common/sshd.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  programs.dconf.enable = true; # TODO: hvorfor trenger jeg denne her?

  systemd.network.wait-online.enable = lib.mkForce false; # to avoid iface or vbox waiting for connection.
  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;
  networking.hostName = "Cerritos";
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
  home-manager.users.hx.home.stateVersion = "24.11";
  system.stateVersion = "24.11";
}
