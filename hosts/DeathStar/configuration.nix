{ config, pkgs, ... }:

{
  imports = [
    # Hardware udev rules
    ./hardware-configuration.nix

    # core dotfiles + graphical things
    # ../../users
    # ../../users/hx
    # ../../users/hx/gui.nix
    # ../../users/hx/cli.nix
    # ../../users/hx/i3

    # Common
    # ../../common/wireguard.nix
    #../../common/bluetooth.nix
    ../../common/docker.nix
    ../../common/networkmanager.nix
    ../../common/fonts.nix
    ../../common/pipewire.nix
    ../../common/tailscale.nix
    #../../common/virtualbox.nix

    # CPU Microcode
    ../../common/intelcpu.nix

    # GPU Drivers
    ../../common/nvidiagpu.nix
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

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  time.timeZone = "Europe/Oslo";
  system.stateVersion = "24.05";
  home-manager.users.francis.home.stateVersion = "24.05";
}
