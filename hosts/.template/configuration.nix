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
      ../../common/bluetooth.nix
      ../../common/docker.nix
      ../../common/fonts.nix
      ../../common/games.nix
      ../../common/kubernetes.nix
      ../../common/obs-studio.nix
      ../../common/openvpn.nix
      ../../common/pulseaudio.nix
      ../../common/steam.nix
      ../../common/security.nix
      ../../common/wireguard.nix

      # CPU Microcode
      ../../common/cpu/intel.nix

      # GPU Drivers
      ../../common/gpu/nvidia.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Change hostname to what you call your system
  networking.hostName = "ChangeMe";

  networking.useDHCP = false;

  # Change interfaces to match your system
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
