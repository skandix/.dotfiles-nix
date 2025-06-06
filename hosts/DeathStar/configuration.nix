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
    ../../home/hx/gui.nix
    ../../home/hx/cli.nix
    ../../home/hx/dev.nix
    ../../home/hx/i3

    # Common
    ../../common/intelcpu.nix
    ../../common/nvidiagpu.nix
    ../../common/docker.nix
    ../../common/fonts.nix
    ../../common/networkmanager.nix
    ../../common/nix-pkg-allow.nix
    ../../common/pipewire.nix
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
  networking.hostName = "DeathStar";
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
