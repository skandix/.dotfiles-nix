{ config, pkgs, ... }:

{
  imports =
    [
      # Hardware udev rules
      ./hardware-configuration.nix

      # core dotfiles + graphical things
      ../../users
      ../../users/skandix
      ../../users/skandix/gui.nix
      ../../users/skandix/cli.nix

      # Common
      ../../common/wireguard.nix
      ../../common/bluetooth.nix
      ../../common/docker.nix
      ../../common/networkmanager.nix
      ../../common/fonts.nix
      ../../common/pulseaudio.nix
      ../../common/security.nix
      ../../common/video.nix
      ../../common/kubernetes.nix

      # CPU Microcode
      ../../common/cpu/intel.nix

      # GPU Drivers
      ../../common/gpu/nvidia.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "DeathStar";

  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;
  networking.networkmanager.enable = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "no";
  };

  time.timeZone = "Europe/Oslo";

  system.stateVersion = "20.09";
}
