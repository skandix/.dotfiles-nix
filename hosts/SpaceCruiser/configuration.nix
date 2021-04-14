{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../users
      ../../users/skandix
      ../../users/skandix/gui.nix
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

  sound.enable = true;
  hardware.pulseaudio.enable = true;

  services.openssh.enable = true;
  networking.firewall.enable = false;
  system.stateVersion = "20.09";
}
