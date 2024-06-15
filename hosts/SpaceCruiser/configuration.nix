{ config, pkgs, ... }:

{
  imports = [
    # Hardware udev rules
    ./hardware-configuration.nix
    # <nixos-hardware/lenovo/thinkpad/t490>

    # Common
    ../../common/networkmanager.nix
    ../../common/docker.nix
    ../../common/bluetooth.nix
    ../../common/fonts.nix
    ../../common/networking-extra.nix
    ../../common/laptop.nix

    # CPU Microcode
    ../../common/intelcpu.nix

    # GPU Drivers
    ../../common/intelgpu.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "SpaceCruiser";
  networking.useDHCP = false;
  networking.interfaces.enp0s31f6.useDHCP = true;
  networking.interfaces.wlp0s20f3.useDHCP = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "no";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  time.timeZone = "Europe/Oslo";
  system.stateVersion = "24.05";
}
