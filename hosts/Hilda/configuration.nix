{ config, pkgs, ... }:

{
  imports =
    [
      # Hardware udev rules
      ./hardware-configuration.nix

      # core dotfiles + graphical things
      ../../users
      ../../users/skandix
      ../../users/skandix/cli.nix

      # Common
      ../../common/docker.nix
      ../../common/security.nix
      ../../common/wireguard.nix
      ../../common/networking-extra.nix
      ../../common/unifi.nix
      ../../common/home-assistant.nix
      ../../common/ssh.nix

      # CPU Microcode
      ../../common/cpu/intel.nix
    ];

  #nixpkgs.config.permittedInsecurePackages = [
    #"homeassistant-0.114.4"
  #];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Change hostname to what you call your system
  networking = {
    usePredictableInterfaceNames = false;
    hostName = "Hilda";
    interfaces.eth0.ipv4.addresses = [{
      address = "192.168.1.5";
      prefixLength = 24;
    }];
    defaultGateway = "192.168.1.1";
  };

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "no";
  };

  time.timeZone = "Europe/Oslo";

  system.stateVersion = "20.09";
}
