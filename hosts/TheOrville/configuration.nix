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
      ../../common/docker.nix
      ../../common/fonts.nix
      ../../common/games.nix
      ../../common/kubernetes.nix
      ../../common/obs-studio.nix
      ../../common/networkmanager.nix
      ../../common/pipewire.nix
      ../../common/steam.nix
      ../../common/wireguard.nix
      ../../common/networking-extra.nix
      ../../common/vagrant.nix
      ../../common/reveal-md.nix

      # CPU Microcode
      ../../common/cpu/amd.nix

      # GPU Drivers
      ../../common/gpu/amd.nix

      # WG
      #./c137.nix
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "TheOrville";
  networking.useDHCP = false;
  networking.interfaces.enp5s0.useDHCP = true;
  networking.interfaces.wlp6s0.useDHCP = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "no";
  };

  time.timeZone = "Europe/Oslo";

  system.stateVersion = "21.11";
}
