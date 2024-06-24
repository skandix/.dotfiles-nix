{ config, pkgs, ... }:

{
  imports = [
    # Hardware udev rules
    ./hardware-configuration.nix

    # core dotfiles + graphical things
    ../../home
    ../../home/hx
    ../../home/hx/gui.nix
    ../../home/hx/cli.nix
    ../../home/hx/i3

    # Common
    ../../common/intelcpu.nix
    ../../common/nvidiagpu.nix
    ../../common/docker.nix
    ../../common/fonts.nix
    ../../common/networkmanager.nix
    ../../common/networking-extra.nix
    ../../common/pipewire.nix
    ../../common/virtualbox.nix
    ../../common/fwupd.nix
    ../../common/security.nix
    ../../common/ssh-client.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  systemd.services.NetworkManager-wait-online.enable = false; # to avoid iface or vbox waiting for connection.
  networking.hostName = "DeathStar";
  networking.useDHCP = false;
  networking.interfaces.eno1.useDHCP = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = { keyMap = "no"; };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  time.timeZone = "Europe/Oslo";
  home-manager.users.hx.home.stateVersion = "24.05";
  system.stateVersion = "24.05";
}
