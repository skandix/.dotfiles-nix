{ config, pkgs, ... }:

{
  imports =
    [
      # Hardware udev rules
      ./hardware-configuration.nix

      # core dotfiles + graphical things
      ../../users
      ../../users/hx
      ../../users/hx/gui.nix
      ../../users/hx/cli.nix

      # Common
      ../../common/wireguard.nix
      ../../common/bluetooth.nix
      ../../common/docker.nix
      ../../common/networkmanager.nix
      ../../common/fonts.nix
      ../../common/pulseaudio.nix
      ../../common/kubernetes.nix
      ../../common/steam.nix
      ../../common/vagrant.nix

      # CPU Microcode
      ../../common/cpu/intel.nix

      # GPU Drivers
      ../../common/gpu/nvidia.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.firewall.enable = false;

  networking.hostName = "DeathStar";
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "no";
  };

  time.timeZone = "Europe/Oslo";

  system.stateVersion = "23.11";
}
