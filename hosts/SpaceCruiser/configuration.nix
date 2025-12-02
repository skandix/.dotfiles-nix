{ config, pkgs, lib, ... }:

{
  imports = [
    # Hardware udev rules
    ./hardware-configuration.nix

    # core dotfiles + graphical things
    ../../home
    ../../home/hx
    ../../home/hx/gui.nix
    ../../home/hx/cli.nix
    ../../home/hx/dev.nix
    ../../home/hx/i3

    # Common
    ../../common/intelcpu.nix
    ../../common/fingerprint.nix
    ../../common/laptop.nix
    ../../common/intelgpu.nix
    ../../common/tailscale.nix
    ../../common/docker.nix
    ../../common/fonts.nix
    ../../common/networkmanager.nix
    ../../common/pipewire.nix
    ../../common/nix-tweakz.nix
    ../../common/nix-pkg-allow.nix
    ../../common/fwupd.nix
    ../../common/ssh-client.nix
    ../../common/autoUpgrade.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = false;

  systemd.network.wait-online.enable = lib.mkForce false; # to avoid iface or vbox waiting for connection.
  systemd.services.NetworkManager-wait-online.enable = false; # to avoid iface or vbox waiting for connection.
  networking.hostName = "SpaceCruiser";
  networking.useDHCP = false;
  networking.interfaces.enp5s0.useDHCP = false;
  networking.interfaces.wlp6s0.useDHCP = false;

  programs.dconf.enable = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    keyMap = "no";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  time.timeZone = "Europe/Oslo";
  home-manager.users.hx.home.stateVersion = "25.11";
  system.stateVersion = "25.11";
}
