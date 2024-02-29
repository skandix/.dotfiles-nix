{ config, pkgs, ... }:

{
  imports =
    [
      # Hardware udev rules
      ./hardware-configuration.nix
      <nixos-hardware/lenovo/thinkpad/t490>

      # core dotfiles + graphical things
      ../../users
      ../../users/hx
      ../../users/hx/gui.nix
      ../../users/hx/cli.nix

      # Common
      ../../common/wireguard.nix
      ../../common/networkmanager.nix
      ../../common/docker.nix
      ../../common/bluetooth.nix
      ../../common/briigth.nix
      ../../common/fonts.nix
      ../../common/pulseaudio.nix
      ../../common/kubernetes.nix
      ../../common/networking-extra.nix
      ../../common/laptop.nix

      # CPU Microcode
      ../../common/cpu/intel.nix

      # GPU Drivers
      ../../common/gpu/intel.nix
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

  time.timeZone = "Europe/Oslo";

  system.stateVersion = "23.11";
}
